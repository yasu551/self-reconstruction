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

ActiveRecord::Schema[8.0].define(version: 2024_12_06_052403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "daily_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "reported_on", null: false
    t.text "content", default: "", null: false
    t.text "keep_action_draft", default: "", null: false
    t.text "problem_action_draft", default: "", null: false
    t.text "try_action_draft", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reported_on"], name: "index_daily_reports_on_reported_on"
    t.index ["user_id", "reported_on"], name: "index_daily_reports_on_user_id_and_reported_on", unique: true
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content", null: false
    t.text "memo", default: "", null: false
    t.boolean "enabled", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "completion_condition", default: "", null: false
    t.text "content", default: "", null: false
    t.text "yesterday_content", default: "", null: false
    t.text "memo", default: "", null: false
    t.string "status", default: "pending", null: false
    t.date "deadline_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content_diff", default: "", null: false
    t.index ["deadline_on"], name: "index_tasks_on_deadline_on"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_reports", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "tasks", "users"
end