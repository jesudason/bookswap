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

ActiveRecord::Schema.define(version: 2018_05_10_003008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "isbn_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "author"
    t.string "plot"
    t.string "year"
    t.string "rating"
    t.string "classification"
    t.string "genre"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "mybooks", force: :cascade do |t|
    t.bigint "book_id"
    t.string "borrower_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_mybooks_on_book_id"
    t.index ["user_id"], name: "index_mybooks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.text "profile_url"
    t.string "username"
    t.string "password_digest"
    t.string "address"
    t.string "suburb"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "long"
    t.string "latd"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_wishlists_on_book_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "books", "users"
  add_foreign_key "mybooks", "books"
  add_foreign_key "mybooks", "users"
  add_foreign_key "wishlists", "books"
  add_foreign_key "wishlists", "users"
end
