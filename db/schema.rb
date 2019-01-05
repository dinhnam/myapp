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

ActiveRecord::Schema.define(version: 2019_01_05_080425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "film_id"
    t.index ["film_id"], name: "index_episodes_on_film_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "type", null: false
    t.string "name"
    t.string "description"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.string "intro"
    t.decimal "average_rate"
    t.integer "number_voter"
    t.string "rate"
    t.integer "all_views"
    t.integer "month_views"
    t.integer "week_views"
    t.integer "day_views"
    t.string "cover"
    t.integer "duration"
    t.datetime "release"
    t.string "quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pretty"
    t.string "string"
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

  create_table "replies", force: :cascade do |t|
    t.string "content"
    t.bigint "comment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id", "created_at"], name: "index_replies_on_user_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "avatar"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  add_foreign_key "episodes", "films"
  add_foreign_key "replies", "comments"
end
