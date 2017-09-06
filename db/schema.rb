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

ActiveRecord::Schema.define(version: 20170906190659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "dead_line"
    t.text "description"
    t.string "card_attachment"
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "cards_labels", id: false, force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "label_id"
    t.index ["card_id"], name: "index_cards_labels_on_card_id"
    t.index ["label_id"], name: "index_cards_labels_on_label_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.text "content"
    t.boolean "is_checked", default: false
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_checklists_on_card_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_comments_on_card_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "connection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "boards", "users"
  add_foreign_key "cards", "lists"
  add_foreign_key "checklists", "cards"
  add_foreign_key "comments", "cards"
  add_foreign_key "lists", "boards"
  add_foreign_key "relationships", "users"
end
