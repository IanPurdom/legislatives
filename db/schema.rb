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

ActiveRecord::Schema.define(version: 20190131095857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id"
    t.string "email"
    t.string "district"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "election_id"
    t.bigint "status_id"
    t.index ["election_id"], name: "index_candidates_on_election_id"
    t.index ["status_id"], name: "index_candidates_on_status_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
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

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.date "election_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "elections"
  add_foreign_key "candidates", "statuses"
  add_foreign_key "candidates", "users"
  add_foreign_key "deputies", "candidates"
end
