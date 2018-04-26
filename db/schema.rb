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

ActiveRecord::Schema.define(version: 20180426114627) do

  create_table "archives", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.integer "type_archive"
    t.integer "resolution"
    t.integer "environment"
    t.string "description"
    t.string "directory"
    t.integer "volume_id"
    t.datetime "inserted_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["volume_id"], name: "index_archives_on_volume_id"
  end

  create_table "volumes", force: :cascade do |t|
    t.string "name"
    t.integer "type_volume"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
