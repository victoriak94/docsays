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

=======
ActiveRecord::Schema.define(version: 2019_01_28_205407) do

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "doctor_id"
    t.integer "patient_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "Suggestions"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "diagnosis_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specialization"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["invitation_token"], name: "index_doctors_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_doctors_on_invitations_count"
    t.index ["invited_by_id"], name: "index_doctors_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_doctors_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "meal_plans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.string "image"
    t.string "uri"
    t.string "healthlabel"
    t.text "ingredients"
    t.text "ingredientlines"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.string "age"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["invitation_token"], name: "index_patients_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_patients_on_invitations_count"
    t.index ["invited_by_id"], name: "index_patients_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_patients_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end
>>>>>>> cd10a796140295e6b8847fb2be6861371616a33c

end
