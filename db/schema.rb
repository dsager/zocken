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

ActiveRecord::Schema.define(version: 20150523223150) do

  create_table "bets", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "status",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "player_id",  null: false
    t.integer  "result_id",  null: false
    t.integer  "bet_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participations", ["bet_id"], name: "index_participations_on_bet_id"
  add_index "participations", ["player_id"], name: "index_participations_on_player_id"
  add_index "participations", ["result_id"], name: "index_participations_on_result_id"

  create_table "players", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.string   "password_digest"
    t.integer  "points",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "players", ["email"], name: "index_players_on_email"
  add_index "players", ["name"], name: "index_players_on_name"

  create_table "results", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "is_correct"
    t.integer  "bet_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "participations_count"
  end

  add_index "results", ["bet_id"], name: "index_results_on_bet_id"

end
