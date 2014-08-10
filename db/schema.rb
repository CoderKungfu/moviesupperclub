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

ActiveRecord::Schema.define(version: 20140810095043) do

  create_table "cinemas", force: true do |t|
    t.string   "name"
    t.string   "group"
    t.string   "cinema_code"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "rating"
    t.text     "synopsis"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showtimes", force: true do |t|
    t.integer  "cinema_id"
    t.integer  "movie_id"
    t.datetime "showtime"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "showtimes", ["cinema_id"], name: "index_showtimes_on_cinema_id"
  add_index "showtimes", ["movie_id"], name: "index_showtimes_on_movie_id"

  create_table "showtimes_tags", id: false, force: true do |t|
    t.integer "showtime_id"
    t.integer "tag_id"
  end

  add_index "showtimes_tags", ["showtime_id", "tag_id"], name: "index_showtimes_tags_on_showtime_id_and_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
