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

ActiveRecord::Schema.define(version: 20150202165144) do

  create_table "blackout_dates", force: true do |t|
    t.integer "resource_id"
    t.string  "resource_type"
    t.integer "user_id"
  end

  create_table "holidays", force: true do |t|
    t.integer "resource_id"
    t.string  "resource_type"
    t.string  "scope"
    t.string  "name"
  end

  create_table "scheduled_dates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day"
  end

  create_table "user_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "email",                          null: false
    t.string   "persistence_token",              null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.string   "crypted_password",               null: false
    t.string   "password_salt",                  null: false
  end

end
