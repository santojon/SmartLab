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

ActiveRecord::Schema.define(version: 20170517022151) do

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
    t.string   "name",       null: false
    t.integer  "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lab_id"
    t.index ["lab_id"], name: "index_desks_on_lab_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "model",       null: false
    t.string   "description"
    t.string   "tag",         null: false
    t.string   "serial",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "desk_id"
    t.index ["desk_id"], name: "index_equipment_on_desk_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.string   "location",    null: false
    t.string   "description", null: false
    t.string   "measure"
    t.integer  "status",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "labs", force: :cascade do |t|
    t.string   "building",   null: false
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "cpf",                                null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.boolean  "admin",              default: false, null: false
    t.integer  "equipment_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["equipment_id"], name: "index_users_on_equipment_id"
  end

  create_table "uses", force: :cascade do |t|
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["equipment_id"], name: "index_uses_on_equipment_id"
  end

end
