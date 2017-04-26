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

ActiveRecord::Schema.define(version: 20170422212835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "agency_name"
    t.string   "agency_url"
    t.string   "agency_timezone"
    t.string   "agency_lang"
    t.string   "agency_phone"
    t.integer  "agency_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.integer  "service_id"
    t.date     "date"
    t.integer  "exception_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "feed_infos", force: :cascade do |t|
    t.string   "feed_publisher_name"
    t.string   "feed_publisher_url"
    t.string   "feed_timezone"
    t.string   "feed_lang"
    t.string   "feed_version"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "route_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.integer  "route_type"
    t.string   "route_color"
    t.string   "route_text_color"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shapes", force: :cascade do |t|
    t.integer  "shape_id"
    t.decimal  "shape_pt_lat"
    t.decimal  "shape_pt_lon"
    t.integer  "shape_pt_sequence"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.string   "trip_id"
    t.time     "arrival_time"
    t.time     "departure_time"
    t.integer  "stop_id"
    t.string   "stop_sequence"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stops", force: :cascade do |t|
    t.integer  "stop_id"
    t.string   "stop_name"
    t.decimal  "stop_lat"
    t.decimal  "stop_lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "route_id"
    t.integer  "trip_id"
    t.string   "trip_headsign"
    t.string   "trip_short_name"
    t.integer  "direction_id"
    t.integer  "shape_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
