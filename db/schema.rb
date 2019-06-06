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

ActiveRecord::Schema.define(version: 2019_06_05_093755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.float "total_price"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "state"
    t.jsonb "payment"
    t.index ["course_id"], name: "index_bookings_on_course_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "course_days", force: :cascade do |t|
    t.string "working_day"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
    t.time "end_time"
    t.index ["course_id"], name: "index_course_days_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "end_date"
    t.date "start_date"
    t.string "level"
    t.string "address"
    t.string "area"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.float "price"
    t.string "video_url"
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
    t.string "picture"
    t.integer "price_cents", default: 0, null: false

    t.string "start_time"
    t.string "integer"

    t.index ["language_id"], name: "index_courses_on_language_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "interest_categories", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interest_tags", force: :cascade do |t|
    t.string "content"
    t.bigint "interest_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_category_id"], name: "index_interest_tags_on_interest_category_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "interest_tag_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_tag_id"], name: "index_user_interests_on_interest_tag_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "biography"
    t.string "native_language"
    t.string "photo"
    t.string "nationality"
    t.float "teacher_rating"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "courses"
  add_foreign_key "bookings", "users"
  add_foreign_key "course_days", "courses"
  add_foreign_key "courses", "languages"
  add_foreign_key "courses", "users"
  add_foreign_key "interest_tags", "interest_categories"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "user_interests", "interest_tags"
  add_foreign_key "user_interests", "users"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
end
