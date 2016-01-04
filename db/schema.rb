# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160103223756) do

  create_table "shovel_jobs", force: :cascade do |t|
    t.integer  "shovel_user_id"
    t.integer  "owner_user_id"
    t.datetime "start_date"
    t.boolean  "owner_confirmation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "shovel_jobs", ["owner_user_id"], name: "index_shovel_jobs_on_owner_user_id"
  add_index "shovel_jobs", ["shovel_user_id"], name: "index_shovel_jobs_on_shovel_user_id"

  create_table "user_connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "connected_user_id"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "user_connections", ["user_id"], name: "index_user_connections_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "username"
    t.string   "address"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "type"
    t.integer  "price"
  end

end
