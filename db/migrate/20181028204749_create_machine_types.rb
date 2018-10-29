class CreateMachineTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_types do |t|
      t.string :kind
      t.integer :google_id
      t.timestamp :creation_timestamp
      t.string :name
      t.string :description
      t.integer :guest_cpus
      t.integer :memory_mb
      t.integer :image_space_gb
      t.integer :maximum_persistent_disks
      t.integer :maximum_persistent_disks_size_gb
      t.string :zone
      t.string :self_link
      t.boolean :is_shared_cpu

      t.timestamps
    end
  end
end
