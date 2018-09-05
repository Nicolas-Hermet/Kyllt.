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

ActiveRecord::Schema.define(version: 2018_09_04_134529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "school"
    t.text "previous_projects"
    t.text "previous_exhibitions"
    t.text "previous_sales"
    t.integer "time_invest_on_project"
    t.text "biography"
    t.integer "locality"
    t.string "iban"
    t.boolean "gcs_read"
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  end

  create_table "buffers", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "mecene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mecene_id"], name: "index_buffers_on_mecene_id"
    t.index ["project_id"], name: "index_buffers_on_project_id"
  end

  create_table "mecenes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "min_budget"
    t.date "max_return_invest"
    t.string "art_category"
    t.integer "locality"
    t.string "iban"
    t.boolean "gcs_read"
    t.index ["email"], name: "index_mecenes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mecenes_on_reset_password_token", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "explanation"
    t.bigint "artist_id"
    t.string "category"
    t.date "duration"
    t.integer "budget"
    t.integer "funding"
    t.string "show_fav_place"
    t.text "scope"
    t.boolean "innovative"
    t.boolean "validated", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_projects_on_artist_id"
  end

  add_foreign_key "buffers", "mecenes"
  add_foreign_key "buffers", "projects"
  add_foreign_key "projects", "artists"
end
