# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_06_013727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gate_id"
    t.bigint "nfc_id"
    t.boolean "is_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gate_id"], name: "index_access_logs_on_gate_id"
    t.index ["nfc_id"], name: "index_access_logs_on_nfc_id"
    t.index ["user_id"], name: "index_access_logs_on_user_id"
  end

  create_table "gate_permissions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "gate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gates", force: :cascade do |t|
    t.string "serial_number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nfcs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nfcs_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_devices", force: :cascade do |t|
    t.bigint "user_id"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.datetime "valid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.bigint "device_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "access_logs", "gates"
  add_foreign_key "access_logs", "nfcs"
  add_foreign_key "access_logs", "users"
  add_foreign_key "nfcs", "users"
  add_foreign_key "user_sessions", "users"
end
