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

ActiveRecord::Schema.define(version: 2019_04_04_182403) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.string "city", null: false
    t.string "block", null: false
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "prefecture_id", null: false
    t.string "relative_last_name", null: false
    t.string "relative_first_name", null: false
    t.string "relative_last_name_kana", null: false
    t.string "relative_first_name_kana", null: false
    t.string "home_phone"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "parent_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_favorite_items_on_item_id"
    t.index ["user_id"], name: "index_favorite_items_on_user_id"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.string "image", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.integer "brand_id"
    t.boolean "shipping_fee", null: false
    t.integer "days_to_ship", null: false
    t.integer "price", null: false
    t.integer "condition", null: false
    t.boolean "sales_condition", default: false, null: false
    t.integer "prefecture_id", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "money_transaction_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "point", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "order_status_id", null: false
    t.index ["order_status_id"], name: "index_money_transaction_records_on_order_status_id"
    t.index ["user_id"], name: "index_money_transaction_records_on_user_id"
  end

  create_table "order_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "purchaser_id", null: false
    t.integer "seller_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_order_statuses_on_item_id"
  end

  create_table "point_transaction_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "point", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "order_status_id", null: false
    t.index ["order_status_id"], name: "index_point_transaction_records_on_order_status_id"
    t.index ["user_id"], name: "index_point_transaction_records_on_user_id"
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

  create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id"
  end

  create_table "user_evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "high_count"
    t.integer "medium_count"
    t.integer "low_count"
    t.integer "evaluating_id", null: false
    t.integer "evaluated_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluated_id"], name: "index_user_evaluations_on_evaluated_id"
    t.index ["evaluating_id"], name: "index_user_evaluations_on_evaluating_id"
  end

  create_table "user_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "birth_y", null: false
    t.integer "birth_m", null: false
    t.integer "birth_d", null: false
    t.string "nickname", null: false
    t.text "avatar"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "movile_phone", null: false
    t.string "card_number"
    t.string "expiration_month"
    t.string "expiration_year"
    t.string "security_code"
    t.index ["nickname"], name: "index_user_profiles_on_nickname"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_items", "items"
  add_foreign_key "favorite_items", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "money_transaction_records", "order_statuses"
  add_foreign_key "money_transaction_records", "users"
  add_foreign_key "order_statuses", "items"
  add_foreign_key "sns_credentials", "users"
  add_foreign_key "user_profiles", "users"
end
