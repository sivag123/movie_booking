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

ActiveRecord::Schema.define(version: 20161009101843) do

  create_table "movie_screens", force: :cascade do |t|
    t.integer  "movie_id",        limit: 4, null: false
    t.integer  "theater_id",      limit: 4, null: false
    t.integer  "show_id",         limit: 4, null: false
    t.date     "show_date",                 null: false
    t.integer  "total_seats",     limit: 4, null: false
    t.integer  "booked_seats",    limit: 4, null: false
    t.integer  "remaining_seats", limit: 4, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "movie_screens", ["movie_id", "theater_id"], name: "index_movie_screens_on_movie_id_and_theater_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name",       limit: 255,                              null: false
    t.integer  "language",   limit: 4,                                null: false
    t.decimal  "ticket_fee",               precision: 10,             null: false
    t.integer  "currency",   limit: 4,                    default: 1, null: false
    t.text     "crew_info",  limit: 65535
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "movies", ["name"], name: "index_movies_on_name", using: :btree

  create_table "shows", force: :cascade do |t|
    t.time     "show_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theaters", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "city",       limit: 255, null: false
    t.string   "state",      limit: 255, null: false
    t.string   "country",    limit: 255, null: false
    t.string   "show_ids",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "theaters", ["name"], name: "index_theaters_on_name", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,                              null: false
    t.integer  "movie_screen_id", limit: 4,                              null: false
    t.decimal  "price",                       precision: 10,             null: false
    t.integer  "quantity",        limit: 4,                  default: 1
    t.decimal  "sub_total",                   precision: 10, default: 0
    t.decimal  "discount_amount",             precision: 10, default: 0
    t.decimal  "total_amount",                precision: 10, default: 0
    t.string   "promo_code",      limit: 255
    t.integer  "active",          limit: 4,                  default: 1
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255,              null: false
    t.integer  "gender",                 limit: 4,                null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
