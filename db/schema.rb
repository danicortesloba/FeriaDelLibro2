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

ActiveRecord::Schema.define(version: 2019_01_05_054243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "address"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "billings", force: :cascade do |t|
    t.string "code"
    t.string "payment_method"
    t.decimal "amount", precision: 10, scale: 2
    t.string "currency"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_billings_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author_first_name"
    t.string "author_last_name"
    t.bigint "publisher_id"
    t.string "cover"
    t.integer "price"
    t.integer "isbn"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_comments", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "comment_id", null: false
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "genre_id", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "publisher_id"
    t.bigint "book_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["publisher_id"], name: "index_comments_on_publisher_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membership_orders", force: :cascade do |t|
    t.bigint "membership_id"
    t.bigint "user_id"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membership_id"], name: "index_membership_orders_on_membership_id"
    t.index ["user_id"], name: "index_membership_orders_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_tags", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.boolean "payed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "billing_id"
    t.index ["billing_id"], name: "index_orders_on_billing_id"
    t.index ["book_id"], name: "index_orders_on_book_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "publisher_comments", force: :cascade do |t|
    t.string "content"
    t.bigint "publisher_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_publisher_comments_on_publisher_id"
    t.index ["user_id"], name: "index_publisher_comments_on_user_id"
  end

  create_table "publisher_comments_publishers", id: false, force: :cascade do |t|
    t.bigint "publisher_id", null: false
    t.bigint "publisher_comment_id", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.integer "rut"
    t.string "giro"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_publishers_on_user_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_readers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "billings", "users"
  add_foreign_key "books", "publishers"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "publishers"
  add_foreign_key "comments", "users"
  add_foreign_key "membership_orders", "memberships"
  add_foreign_key "membership_orders", "users"
  add_foreign_key "orders", "billings"
  add_foreign_key "orders", "books"
  add_foreign_key "orders", "users"
  add_foreign_key "publisher_comments", "publishers"
  add_foreign_key "publisher_comments", "users"
  add_foreign_key "publishers", "users"
  add_foreign_key "readers", "users"
end
