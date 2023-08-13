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

ActiveRecord::Schema[7.0].define(version: 2023_08_13_171829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_type_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "option_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_type_id"], name: "index_option_type_products_on_option_type_id"
    t.index ["product_id"], name: "index_option_type_products_on_product_id"
  end

  create_table "option_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_value_variants", force: :cascade do |t|
    t.bigint "variant_id", null: false
    t.bigint "option_value_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_value_id"], name: "index_option_value_variants_on_option_value_id"
    t.index ["variant_id"], name: "index_option_value_variants_on_variant_id"
  end

  create_table "option_values", force: :cascade do |t|
    t.bigint "option_type_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_type_id"], name: "index_option_values_on_option_type_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "cart_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_order_items_on_cart_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orderables", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "cart_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "variant_id", null: false
    t.index ["cart_id"], name: "index_orderables_on_cart_id"
    t.index ["product_id"], name: "index_orderables_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.decimal "total_amount", precision: 10, scale: 2
    t.date "order_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 10, scale: 2
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "customer"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  create_table "variants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.decimal "price"
    t.integer "quantity"
    t.integer "product_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "profile_image"
    t.string "cover_image"
    t.string "product_type"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "option_type_products", "option_types"
  add_foreign_key "option_type_products", "products"
  add_foreign_key "option_value_variants", "option_values"
  add_foreign_key "option_value_variants", "variants"
  add_foreign_key "option_values", "option_types"
  add_foreign_key "order_items", "products"
  add_foreign_key "orderables", "carts"
  add_foreign_key "orderables", "products"
  add_foreign_key "orderables", "variants"
  add_foreign_key "orders", "users"
  add_foreign_key "variants", "products"
end
