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

ActiveRecord::Schema.define(version: 20130928174249) do

  create_table "discount_wheel_spins", force: true do |t|
    t.string   "prize"
    t.integer  "user_id"
    t.boolean  "given",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "gender"
    t.integer  "fb_id",                  limit: 8
    t.string   "oauth_token"
    t.datetime "oauth_token_issued_at"
    t.datetime "oauth_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
