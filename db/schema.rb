# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151107234211) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "boxes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "catalog_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "meta_tags"
  end

  add_index "boxes", ["catalog_id"], name: "index_boxes_on_catalog_id"

  create_table "brands", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.integer  "box_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "image_brand_file_name"
    t.string   "image_brand_content_type"
    t.integer  "image_brand_file_size"
    t.datetime "image_brand_updated_at"
  end

  add_index "brands", ["box_id"], name: "index_brands_on_box_id"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image_catalog_file_name"
    t.string   "image_catalog_content_type"
    t.integer  "image_catalog_file_size"
    t.datetime "image_catalog_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "filtr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filtrs", force: :cascade do |t|
    t.string   "body"
    t.integer  "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "filtrs", ["box_id"], name: "index_filtrs_on_box_id"

  create_table "header_sites", force: :cascade do |t|
    t.string   "description"
    t.string   "keywords"
    t.string   "title"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "imagespecs", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "imagespecs", ["product_id"], name: "index_imagespecs_on_product_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "description"
    t.text     "addinformation"
    t.integer  "price"
    t.string   "model",                      limit: 255
    t.string   "warranty",                   limit: 255
    t.string   "madein",                     limit: 255
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spec_column1",               limit: 255
    t.string   "spec_column2",               limit: 255
    t.string   "title",                      limit: 255
    t.string   "image_product_file_name"
    t.string   "image_product_content_type"
    t.integer  "image_product_file_size"
    t.datetime "image_product_updated_at"
    t.string   "meta_title"
    t.string   "meta_author"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "recommend"
  end

  create_table "setting_pages", force: :cascade do |t|
    t.string   "course",     default: "1"
    t.integer  "comments",   default: 1
    t.integer  "sliders",    default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "name"
    t.string   "url_item"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "specifications", force: :cascade do |t|
    t.string   "title"
    t.string   "column_1"
    t.string   "column_2"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "specifications", ["product_id"], name: "index_specifications_on_product_id"

end
