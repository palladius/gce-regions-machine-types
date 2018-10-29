class CreateMachineTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_types do |t|
      t.string :kind
      t.integer :google_id
      t.timestamp :creationTimestamp
      t.string :name
      t.string :description
      t.integer :guestCpus
      t.integer :memoryMb
      t.integer :imageSpaceGb
      t.integer :maximumPersistentDisks
      t.integer :maximumPersistentDisksSizeGb
      t.string :zone
      t.string :selfLink
      t.boolean :isSharedCpu
      # references to GceZone element
      t.references :gce_zone, foreign_key: true

      t.timestamps
    end
  end
end
