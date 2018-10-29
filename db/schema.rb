# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_28_204749) do

  create_table "gce_regions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.string "default_zones"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gce_zones", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.integer "gce_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gce_region_id"], name: "index_gce_zones_on_gce_region_id"
  end

  create_table "machine_types", force: :cascade do |t|
    t.string "kind"
    t.integer "google_id"
    t.datetime "creationTimestamp"
    t.string "name"
    t.string "description"
    t.integer "guestCpus"
    t.integer "memoryMb"
    t.integer "imageSpaceGb"
    t.integer "maximumPersistentDisks"
    t.integer "maximumPersistentDisksSizeGb"
    t.string "zone"
    t.string "selfLink"
    t.boolean "isSharedCpu"
    t.integer "gce_zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gce_zone_id"], name: "index_machine_types_on_gce_zone_id"
  end

end
