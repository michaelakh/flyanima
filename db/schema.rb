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

ActiveRecord::Schema.define(version: 20170408100605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.string   "iata"
    t.string   "phone_no"
    t.text     "contact_link"
    t.text     "pet_info_link"
    t.text     "comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "iata"
    t.string   "icao"
    t.decimal  "latitude_deg"
    t.decimal  "longitude_deg"
    t.integer  "altitude_feet"
    t.integer  "timezone"
    t.string   "DST"
    t.string   "tz_database_timezone"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "a_type"
    t.string   "a_source"
  end

  create_table "city_airport_ita_codes", force: :cascade do |t|
    t.string   "code"
    t.string   "city"
    t.string   "airport"
    t.string   "country"
    t.integer  "searches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport"], name: "index_city_airport_ita_codes_on_airport", using: :btree
    t.index ["city"], name: "index_city_airport_ita_codes_on_city", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "keywords"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "post_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
