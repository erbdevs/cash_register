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

ActiveRecord::Schema.define(version: 2021_12_24_120237) do

  create_table "basket_items", force: :cascade do |t|
    t.integer "basket_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "unit_price", precision: 8, scale: 2
    t.decimal "total_price", precision: 8, scale: 2
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["product_id"], name: "index_basket_items_on_product_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.string "client"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "subtotal", precision: 8, scale: 2
    t.decimal "total", precision: 8, scale: 2
  end

  create_table "factor_discounts", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "name"
    t.integer "min_products_number"
    t.integer "max_products_number"
    t.boolean "enabled", default: false
    t.decimal "value", precision: 2, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_factor_discounts_on_product_id"
  end

  create_table "pricing_rules", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "name"
    t.integer "min_products_number"
    t.integer "max_products_number"
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_pricing_rules_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unitary_price_discounts", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "name"
    t.integer "min_products_number"
    t.integer "max_products_number"
    t.boolean "enabled"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_unitary_price_discounts_on_product_id"
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "products"
  add_foreign_key "factor_discounts", "products"
  add_foreign_key "pricing_rules", "products"
  add_foreign_key "unitary_price_discounts", "products"
end
