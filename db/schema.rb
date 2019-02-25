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

ActiveRecord::Schema.define(version: 2019_02_25_091941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audits", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "status_id"
    t.bigint "user_id"
    t.datetime "validation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "action"
    t.index ["candidate_id"], name: "index_audits_on_candidate_id"
    t.index ["status_id"], name: "index_audits_on_status_id"
    t.index ["user_id"], name: "index_audits_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "user_id"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "election_id"
    t.bigint "status_id"
    t.string "mandate"
    t.string "address"
    t.bigint "district_id"
    t.index ["district_id"], name: "index_candidates_on_district_id"
    t.index ["election_id"], name: "index_candidates_on_election_id"
    t.index ["status_id"], name: "index_candidates_on_status_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_code"
  end

  create_table "deputies", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "candidate_id"
    t.string "profession"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_deputies_on_candidate_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "code"
    t.bigint "department_id"
    t.string "num_district"
    t.string "region"
    t.string "code_region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_districts_on_department_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.date "election_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.string "next_action"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "role_id"
    t.bigint "department_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "audits", "candidates"
  add_foreign_key "audits", "statuses"
  add_foreign_key "audits", "users"
  add_foreign_key "candidates", "districts"
  add_foreign_key "candidates", "elections"
  add_foreign_key "candidates", "statuses"
  add_foreign_key "candidates", "users"
  add_foreign_key "deputies", "candidates"
  add_foreign_key "districts", "departments"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
