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

ActiveRecord::Schema.define(version: 20131120085954) do

  create_table "bosses", force: true do |t|
    t.integer  "user_id"
    t.integer  "boss_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overworks", force: true do |t|
    t.integer  "user_id",          default: 0,                     null: false
    t.date     "work_date",                                        null: false
    t.string   "subject",          default: "",                    null: false
    t.time     "work_start_time",  default: '2000-01-01 00:00:00', null: false
    t.time     "work_finish_time", default: '2000-01-01 00:00:00', null: false
    t.string   "comment",          default: "",                    null: false
    t.integer  "status",           default: 0,                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "overworks", ["user_id", "work_date"], name: "index_overworks_on_user_id_and_work_date", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
