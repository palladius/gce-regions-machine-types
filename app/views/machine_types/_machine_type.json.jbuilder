json.extract! machine_type, :id, :kind, :google_id, :creation_timestamp, :name, :description, :guest_cpus, :memory_mb, :image_space_gb, :maximum_persistent_disks, :maximum_persistent_disks_size_gb, :zone, :self_link, :is_shared_cpu, :created_at, :updated_at
json.url machine_type_url(machine_type, format: :json)
