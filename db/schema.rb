# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_13_175945) do

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "eagle_Required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scout_badges", force: :cascade do |t|
    t.datetime "date"
    t.boolean "fun"
    t.integer "scout_id", null: false
    t.integer "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_scout_badges_on_badge_id"
    t.index ["scout_id"], name: "index_scout_badges_on_scout_id"
  end

  create_table "scouts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rank"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "location"
    t.date "date"
    t.integer "scout_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "scout_badges", "badges"
  add_foreign_key "scout_badges", "scouts"
end
