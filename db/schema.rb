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

ActiveRecord::Schema.define(version: 2018_12_20_062434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feature_films", force: :cascade do |t|
    t.integer "film_id"
    t.string "feature_type"
    t.integer "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id", "feature_type", "film_id"], name: "index_feature_films_on_feature_id_and_feature_type_and_film_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "type", null: false
    t.string "name"
    t.string "intro"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.string "intro"
    t.integer "imdb"
    t.integer "rating"
    t.string "cover"
    t.string "trailer"
    t.string "link"
    t.integer "duration"
    t.integer "view"
    t.datetime "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "film_id"
    t.integer "listable_id"
    t.string "listable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_lists_on_film_id"
    t.index ["listable_id", "listable_type"], name: "index_lists_on_listable_id_and_listable_type"
  end

  create_table "notices", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "link"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "avatar"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
