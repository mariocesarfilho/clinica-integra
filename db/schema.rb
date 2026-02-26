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

ActiveRecord::Schema[8.1].define(version: 2026_02_24_021810) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "peaple_id", null: false
    t.datetime "updated_at", null: false
    t.index ["peaple_id"], name: "index_patients_on_peaple_id"
  end

  create_table "peaples", force: :cascade do |t|
    t.date "birth_date"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "responsibles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "peaple_id", null: false
    t.datetime "updated_at", null: false
    t.index ["peaple_id"], name: "index_responsibles_on_peaple_id"
  end

  create_table "therapists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "peaple_id", null: false
    t.datetime "updated_at", null: false
    t.index ["peaple_id"], name: "index_therapists_on_peaple_id"
  end

  add_foreign_key "patients", "peaples"
  add_foreign_key "responsibles", "peaples"
  add_foreign_key "therapists", "peaples"
end
