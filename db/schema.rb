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

ActiveRecord::Schema.define(version: 2019_01_06_104945) do

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
    t.string "thumb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "trailer"
    t.string "cover"
    t.integer "duration"
    t.datetime "release"
    t.string "quality"
    t.integer "total_episodes"
    t.decimal "rates", default: "0.0"
    t.integer "views", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pretty_param"
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

  create_table "rates", force: :cascade do |t|
    t.integer "star_5", default: 0
    t.integer "star_4", default: 0
    t.integer "star_3", default: 0
    t.integer "star_2", default: 0
    t.integer "star_1", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "film_id"
    t.index ["film_id"], name: "index_rates_on_film_id"
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
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
  end

  create_table "views", force: :cascade do |t|
    t.integer "year_views", default: 0
    t.integer "month_views", default: 0
    t.integer "week_views", default: 0
    t.integer "day_views", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "film_id"
    t.index ["film_id"], name: "index_views_on_film_id"
  end

  add_foreign_key "episodes", "films"
  add_foreign_key "rates", "films"
  add_foreign_key "replies", "comments"
  add_foreign_key "views", "films"
end
