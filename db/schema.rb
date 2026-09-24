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

ActiveRecord::Schema[7.1].define(version: 2026_09_24_214053) do
  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "recurring_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "time_zone", default: "UTC", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.boolean "completed"
    t.datetime "due_date"
    t.json "recurrence_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "webinars", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "finishes_at"
    t.string "time_zone_name"
    t.json "schedule_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
