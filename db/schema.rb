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

ActiveRecord::Schema.define(:version => 20130514094158) do

  create_table "Roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mobile"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.string   "address"
    t.string   "cap"
    t.string   "city"
    t.string   "status"
    t.string   "region"
    t.string   "office"
    t.string   "secondary_mobile"
    t.string   "province"
    t.string   "position"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cap"
    t.string   "city"
    t.integer  "category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "website"
    t.boolean  "is_global_service"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "region"
    t.string   "province"
    t.integer  "acquisition"
    t.text     "description"
  end

  create_table "companies_relationships", :force => true do |t|
    t.integer  "company_id"
    t.integer  "associated_company_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "body"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partenerships", :force => true do |t|
    t.integer  "client_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "client_id"
    t.string   "title"
    t.text     "description"
    t.datetime "executed_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.text     "description"
    t.datetime "due_date"
    t.boolean  "done",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "owner_id"
  end

  create_table "user_company_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_company_assignments", ["company_id"], :name => "index_user_company_assignments_on_company_id"
  add_index "user_company_assignments", ["user_id"], :name => "index_user_company_assignments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
