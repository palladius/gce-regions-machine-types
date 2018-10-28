# GCE mapping between Regions and MachineTypes

This is Riccardo's app to map zone/regions to MachineTypes
with utility to search machine of a certain size (e.g. at least X cpus
and so on).

It can work *offline* by using a static JSON file provided with the package or you can use the APIs
yourself and have a more up-to-date (near-realtime) data retrieval.

# Install


    # Rails 5.2.1 , ruby 2.4 -> so hot right now! On 2018-10-28
    # I suggest to use rbenv so you don't need to deturpate your local env.
    git clone https://github.com/palladius/gce-regions-machine-types
    make run

# TODOs

* Make it work with Docker

# Thanks

* DHH
* Matz
* Scott Van W.