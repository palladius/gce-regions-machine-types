

run:
	bundle install
	rails server

routes:
	rails routes

run-docker:
	@echo TODO with pure docker, lets use docker composer now.
	# See https://github.com/pacuna/rails5-docker-alpine
	docker-compose build
	#docker-compose run --rm web bin/rails db:create
	docker-compose run --rm web bin/rails db:migrate
	docker-compose up -d

install-from-scratch:
	rails new gce-regions-machine-types
	rails generate controller Welcome index about license
	rails generate scaffold GceRegion name:string address:string description:text is_active:boolean
	rails generate scaffold GceZone   name:string is_active:boolean GceRegion:references
	rails generate scaffold machine_type kind:string google_id:integer creation_timestamp:timestamp \
	name:string description:string guest_cpus:integer memory_mb:integer image_space_gb:integer \
	maximum_persistent_disks:integer maximum_persistent_disks_size_gb:integer zone:string \
	self_link:string is_shared_cpu:boolean

