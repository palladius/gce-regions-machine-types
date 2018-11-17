
require 'json'

$normal_machine_types_json = JSON.parse( File.open("#{Rails.root}/db/fixtures/machineTypes.aggregatedList.json" ).read )

$file_properties = {
   :machine_types      => File::Stat.new( File.open("#{Rails.root}/db/fixtures/machineTypes.aggregatedList.json")),
   :accelerator_types => File::Stat.new( File.open("#{Rails.root}/db/fixtures/acceleratorTypes.aggregatedList.json")),
   :regions            => File::Stat.new( File.open("#{Rails.root}/db/fixtures/regions.txt")),
}
#machineTypes.aggregatedList.json
#$machine_types_items = $sample_machine_types_json['items']

# Accelerators
=begin
    {
     "kind": "compute#acceleratorType",
     "id": "10010",
     "creationTimestamp": "1969-12-31T16:00:00.000-08:00",
     "name": "nvidia-tesla-p4",
     "description": "NVIDIA Tesla P4",
     "zone": "https://www.googleapis.com/compute/v1/projects/ric-cccwiki/zones/us-west2-c",
     "selfLink": "https://www.googleapis.com/compute/v1/projects/ric-cccwiki/zones/us-west2-c/acceleratorTypes/nvidia-tesla-p4",
     "maximumCardsPerInstance": 4
    },
=end