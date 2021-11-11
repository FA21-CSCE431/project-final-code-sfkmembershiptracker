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

ActiveRecord::Schema.define(version: 2021_11_11_192742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_answers", force: :cascade do |t|
    t.text "answer"
    t.text "question"
    t.string "member_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "application_questions", force: :cascade do |t|
    t.text "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "location"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone"
    t.bigint "position_id", default: 1, null: false
    t.string "grad_date"
    t.integer "points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id"], name: "index_members_on_position_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.decimal "amount"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "role", null: false
    t.boolean "can_change_positions", default: false, null: false
    t.boolean "can_change_events", default: false, null: false
    t.boolean "can_change_roster", default: false, null: false
    t.boolean "can_change_payments", default: false, null: false
    t.boolean "member", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
  end

  create_table "users", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "members", "positions"
  add_foreign_key "members", "users", column: "email", primary_key: "email"
  add_foreign_key "participants", "events"
end
