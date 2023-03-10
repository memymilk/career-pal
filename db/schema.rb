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

ActiveRecord::Schema[7.0].define(version: 2023_03_10_114420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "giver_id"
    t.bigint "videocall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "written_feedback"
    t.integer "overall_impression"
    t.integer "eye_contact"
    t.integer "background_presentation"
    t.integer "problem_solving"
    t.integer "verbal_communication"
    t.integer "body_language"
    t.integer "enthusiasm"
    t.integer "professional_appearance"
    t.integer "hireability"
    t.integer "confidence"
    t.index ["giver_id"], name: "index_feedbacks_on_giver_id"
    t.index ["videocall_id"], name: "index_feedbacks_on_videocall_id"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "question"
    t.text "answer"
    t.boolean "question_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "work_experience"
    t.string "education"
    t.text "extra_info"
    t.boolean "ready"
    t.integer "queue_pos"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videocalls", force: :cascade do |t|
    t.bigint "user_one_id"
    t.bigint "user_two_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_one_id"], name: "index_videocalls_on_user_one_id"
    t.index ["user_two_id"], name: "index_videocalls_on_user_two_id"
  end

  add_foreign_key "feedbacks", "users", column: "giver_id"
  add_foreign_key "videocalls", "users", column: "user_one_id"
  add_foreign_key "videocalls", "users", column: "user_two_id"
end
