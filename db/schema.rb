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

ActiveRecord::Schema.define(version: 20150922021519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.integer  "user_selected_topic_id"
    t.integer  "hour_id"
    t.boolean  "taken"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "availabilities", ["hour_id"], name: "index_availabilities_on_hour_id", using: :btree
  add_index "availabilities", ["user_selected_topic_id"], name: "index_availabilities_on_user_selected_topic_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hours", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "day"
    t.integer  "hr"
    t.boolean  "taken?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "month"
  end

  add_index "hours", ["user_id"], name: "index_hours_on_user_id", using: :btree

  create_table "potential_pairs", force: :cascade do |t|
    t.boolean  "user1_accepted"
    t.boolean  "user2_accepted"
    t.integer  "availability1_id"
    t.integer  "availability2_id"
    t.integer  "topic_id"
    t.integer  "hour_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "potential_pairs", ["availability1_id"], name: "index_potential_pairs_on_availability1_id", using: :btree
  add_index "potential_pairs", ["hour_id"], name: "index_potential_pairs_on_hour_id", using: :btree
  add_index "potential_pairs", ["topic_id"], name: "index_potential_pairs_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics", ["group_id"], name: "index_topics_on_group_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "user_selected_topics", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.boolean  "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_selected_topics", ["topic_id"], name: "index_user_selected_topics_on_topic_id", using: :btree
  add_index "user_selected_topics", ["user_id"], name: "index_user_selected_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "handle",                              null: false
    t.string   "zipcode",                             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true, using: :btree
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "availabilities", "hours"
  add_foreign_key "availabilities", "user_selected_topics"
  add_foreign_key "hours", "users"
  add_foreign_key "potential_pairs", "hours"
  add_foreign_key "potential_pairs", "topics"
  add_foreign_key "topics", "groups"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "user_selected_topics", "topics"
  add_foreign_key "user_selected_topics", "users"
end
