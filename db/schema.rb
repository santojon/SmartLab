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

ActiveRecord::Schema.define(version: 20170517013103) do

  create_table "accesses", force: :cascade do |t|
    t.integer  "desk_id"
    t.integer  "user_id"
    t.datetime "devolution_time"
    t.binary   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["desk_id"], name: "index_accesses_on_desk_id"
    t.index ["user_id"], name: "index_accesses_on_user_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lab_id"
    t.index ["lab_id"], name: "index_desks_on_lab_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "model"
    t.string   "description"
    t.string   "tag"
    t.string   "serial"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.string   "location"
    t.string   "description"
    t.string   "measure"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "labs", force: :cascade do |t|
    t.string   "building"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "password"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
