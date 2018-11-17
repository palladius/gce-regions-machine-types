# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


seed_version = '1.2'
create_regions_and_zones = true
create_machine_types = true
file_timestamp =  File.mtime("#{Rails.root}/db/regions.txt")

if create_regions_and_zones

  # sample regions
  GceRegion.create(name: 'southamerica-east1', address: 'São Paulo, Brazil', default_zones: 'a,b,c')
  GceRegion.create(name: 'southamerica-east1', address: 'São Paulo, Brazil', default_zones: 'a,b,c') # should fail as name is taken
  #GceZone.create(name: 'southamerica-east1-a')

  # Autogenerate from Regions.txt FILE.
  f = File.open("#{Rails.root}/db/fixtures/regions.txt").readlines()
  f.each do |line|
    region_name, commasep_zones, address = line.split("\t")
    r = GceRegion.create(
      name: region_name, 
      address: address,
      description: "[db/seed.rb] taken from `regions.txt` (cut and pasted from: https://cloud.google.com/compute/docs/regions-zones/ ) and updated to #{file_timestamp} (seed_version: #{seed_version})",
      default_zones: commasep_zones,
    )
    print "New region: #{r}\n"
    r.save
  end

  # Sample zones
  sample_region = GceRegion.second
  sample_region.autocreate_child_zones

  # Create zones for ALL regions
  GceRegion.all.each do |r|
    r.autocreate_child_zones
  end

end

if create_machine_types
    # t.string :kind
    # t.integer :google_id
    # t.timestamp :creation_timestamp
    # t.string :name
    # t.string :description
    # t.integer :guest_cpus
    # t.integer :memory_mb
    # t.integer :image_space_gb
    # t.integer :maximum_persistent_disks
    # t.integer :maximum_persistent_disks_size_gb
    # t.string :zone
    # t.string :self_link
    # t.boolean :is_shared_cpu
  ## JSON
  $normal_machine_types_json = JSON.parse( File.open("#{Rails.root}/db/fixtures/machineTypes.aggregatedList.json" ).read )
  $normal_machine_types_json['items'].each do |mt|
    #print "\n+++++++++++++++++++ AAA ", mt, "\n"
    # zones/asia-east2-c
    # - {"warning"=>{"code"=>"NO_RESULTS_ON_PAGE", "message"=>"There are no results for scope 'zones/asia-east2-c' on this page.", "data"=>[{"key"=>"scope", "value"=>"zones/asia-east2-c"}]}}
    zone_name, payload = mt
    warning = payload['warning']
    machineTypes = payload['machineTypes']
    #print " Zone: #{zone_name}\n"
    #print " Warning: #{warning}\n"
    #payload.each do |k,v| # unknown
    #  print " - DEB #{k} :: #{v}\n"
    #end
    if machineTypes
      machineTypes.each do |mt| # unknown
        if mt['kind'] == "compute#machineType" # right class!
          print "\nMTDEB(virgin): #{mt}\n"
          mt['gce_zone_id'] = GceZone.find_by_name(mt['zone']).id
          mt['google_id'] = mt['id']
          mt['id'] = nil
          print "\nMTDEB(precreate): #{mt}\n"
          m = MachineType.create(mt)
          print "MT.toString: #{m}\n"
          ret = m.save
          print "ret: #{ret}\n"
        else
          raise "Wrong kind! #{ mt['kind'] }"
        end
      end
    end

  end
  #card = Card.new(ActiveSupport::JSON.decode(json))
end

print "rake db:seed completed!\n"
