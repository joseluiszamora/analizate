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

ActiveRecord::Schema.define(version: 20130927225505) do

  create_table "analyses", force: true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.date     "receipt_date"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "receipt_time"
    t.time     "delivery_time"
  end

  add_index "analyses", ["doctor_id"], name: "index_analyses_on_doctor_id", using: :btree
  add_index "analyses", ["patient_id"], name: "index_analyses_on_patient_id", using: :btree

  create_table "analysis_categories", force: true do |t|
    t.integer  "analysis_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "analysis_categories", ["analysis_id"], name: "index_analysis_categories_on_analysis_id", using: :btree
  add_index "analysis_categories", ["category_id"], name: "index_analysis_categories_on_category_id", using: :btree

  create_table "analysis_tests", force: true do |t|
    t.integer  "test_id"
    t.integer  "analysis_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "result"
  end

  add_index "analysis_tests", ["analysis_category_id"], name: "index_analysis_tests_on_analysis_category_id", using: :btree
  add_index "analysis_tests", ["test_id"], name: "index_analysis_tests_on_test_id", using: :btree

  create_table "institutions", force: true do |t|
    t.string   "category"
    t.string   "name"
    t.text     "address"
    t.text     "desc"
    t.string   "phone"
    t.string   "mail"
    t.string   "web"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "laboratories", force: true do |t|
    t.integer  "analysis_id"
    t.integer  "test_id"
    t.float    "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
    t.string   "image"
  end

  add_index "laboratories", ["analysis_id"], name: "index_laboratories_on_analysis_id", using: :btree
  add_index "laboratories", ["test_id"], name: "index_laboratories_on_test_id", using: :btree

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_categories", force: true do |t|
    t.string   "description"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_categories", ["ancestry"], name: "index_test_categories_on_ancestry", using: :btree

  create_table "tests", force: true do |t|
    t.string   "parameter"
    t.string   "unit"
    t.string   "reference_values"
    t.string   "test_type"
    t.text     "description"
    t.string   "image"
    t.integer  "test_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["test_category_id"], name: "index_tests_on_test_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "", null: false
    t.string   "user_type"
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone"
    t.string   "cellular"
    t.date     "birthday"
    t.text     "notes"
    t.string   "image"
    t.string   "role"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
