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

ActiveRecord::Schema.define(version: 20140103180935) do

  create_table "entries", force: true do |t|
    t.string   "key"
    t.string   "file_uid"
    t.integer  "file_size"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["key"], name: "index_entries_on_key"
  add_index "entries", ["updated_at"], name: "index_entries_on_updated_at"

  create_table "storage_chunks", force: true do |t|
    t.integer "file_id"
    t.integer "idx"
    t.binary  "encoded_data", limit: 65536
  end

  add_index "storage_chunks", ["file_id"], name: "index_storage_chunks_on_file_id"

  create_table "storage_files", force: true do |t|
    t.text     "metadata"
    t.datetime "accessed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
