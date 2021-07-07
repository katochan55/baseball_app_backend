# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_24_130734) do

  create_table "team_results", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "year", null: false
    t.integer "rank", null: false
    t.integer "wins_count", default: 0, null: false
    t.integer "loses_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id", "year"], name: "index_team_results_on_team_id_and_year", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "founded_year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "league", default: 0, null: false
  end

  add_foreign_key "team_results", "teams"
end
