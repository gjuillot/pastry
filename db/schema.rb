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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160223134737) do

  create_table "html_snippets", :force => true do |t|
    t.string "location"
    t.text   "html"
  end

  create_table "ingredient_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "ingredient_category_id"
  end

  create_table "investment_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "investments", :force => true do |t|
    t.string   "name"
    t.integer  "investment_category_id"
    t.integer  "user_id"
    t.decimal  "price"
    t.text     "comment"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "investments", ["investment_category_id"], :name => "index_investments_on_investment_category_id"
  add_index "investments", ["user_id"], :name => "index_investments_on_user_id"

  create_table "macaron_categories", :force => true do |t|
    t.string "name"
  end

  create_table "macaron_parfums", :force => true do |t|
    t.string  "name"
    t.integer "macaron_category_id"
  end

  create_table "macaron_prices", :force => true do |t|
    t.string  "text"
    t.decimal "price"
  end

  create_table "prices", :force => true do |t|
    t.integer  "ingredient_id"
    t.string   "place"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "prices", ["ingredient_id"], :name => "index_prices_on_ingredient_id"

  create_table "product_images", :force => true do |t|
    t.integer "product_id"
    t.string  "url"
    t.string  "usage"
  end

  create_table "product_prices", :force => true do |t|
    t.integer "product_id"
    t.string  "text"
    t.decimal "price"
  end

  create_table "products", :force => true do |t|
    t.string  "type"
    t.string  "name"
    t.string  "description"
    t.string  "allergenes"
    t.boolean "published"
  end

  create_table "recipe_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "basic",      :default => false
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.integer  "recipe_step_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "recipe_ingredients", ["ingredient_id"], :name => "index_recipe_ingredients_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_step_id"], :name => "index_recipe_ingredients_on_recipe_step_id"

  create_table "recipe_steps", :force => true do |t|
    t.integer  "recipe_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "recipe_steps", ["recipe_id"], :name => "index_recipe_steps_on_recipe_id"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "recipe_category_id"
    t.boolean  "sellable"
    t.text     "public_comment"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
