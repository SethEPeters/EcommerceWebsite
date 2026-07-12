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

ActiveRecord::Schema[8.1].define(version: 2026_07_12_182732) do
  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "province"
    t.string "street_address"
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "artist"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "item_image_path"
    t.float "price"
    t.integer "quantity"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "date_price_good_until"
    t.string "item_image_path"
    t.float "price_at_purchase"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "date_of_purchase"
    t.string "delivery_address"
    t.float "order_total_at_purchase"
    t.datetime "updated_at", null: false
  end

  create_table "province_taxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.float "gst"
    t.float "hst"
    t.string "province"
    t.float "pst"
    t.datetime "updated_at", null: false
  end
end
