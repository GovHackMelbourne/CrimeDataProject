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

ActiveRecord::Schema.define(version: 20150704152418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crime_data", force: :cascade do |t|
    t.string   "category"
    t.string   "local_authority"
    t.string   "time"
    t.string   "season"
    t.string   "light"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "category"
    t.string   "question"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.string   "answer_4"
    t.string   "solution"
    t.string   "correct"
    t.string   "incorrect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string   "tip"
    t.integer  "crime_datum_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tips", ["crime_datum_id"], name: "index_tips_on_crime_datum_id", using: :btree

  add_foreign_key "tips", "crime_data"
end
