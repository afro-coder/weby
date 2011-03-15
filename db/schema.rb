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

ActiveRecord::Schema.define(:version => 20110315120847) do

  create_table "banners", :force => true do |t|
    t.datetime "date_begin_at"
    t.datetime "date_end_at"
    t.string   "title"
    t.text     "text"
    t.string   "url"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "hide"
    t.integer  "repository_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "size"
    t.boolean  "publish"
    t.integer  "site_id"
  end

  create_table "csses", :force => true do |t|
    t.string   "name"
    t.text     "css"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks_groups", :id => false, :force => true do |t|
    t.integer "feedback_id", :null => false
    t.integer "group_id",    :null => false
  end

  add_index "feedbacks_groups", ["feedback_id", "group_id"], :name => "index_feedbacks_groups_on_feedback_id_and_group_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "group_id", :null => false
    t.integer "user_id",  :null => false
  end

  add_index "groups_users", ["group_id", "user_id"], :name => "index_groups_users_on_group_id_and_user_id", :unique => true

  create_table "menus", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "pages", :force => true do |t|
    t.datetime "date_begin_at"
    t.datetime "date_end_at"
    t.string   "status"
    t.integer  "author_id"
    t.text     "text"
    t.string   "url"
    t.integer  "site_id"
    t.string   "source"
    t.string   "title"
    t.string   "kind"
    t.string   "local"
    t.datetime "event_begin"
    t.datetime "event_end"
    t.string   "event_email"
    t.string   "subject"
    t.string   "align"
    t.string   "type",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "summary"
    t.integer  "repository_id"
    t.string   "size"
    t.boolean  "publish"
    t.boolean  "front"
    t.integer  "position"
  end

  create_table "pages_repositories", :id => false, :force => true do |t|
    t.integer "page_id"
    t.integer "repository_id"
  end

  create_table "repositories", :force => true do |t|
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "archive_file_name"
    t.string   "archive_content_type"
    t.integer  "archive_file_size"
    t.datetime "archive_updated_at"
    t.string   "description"
  end

  create_table "rights", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rights_roles", ["role_id", "right_id"], :name => "index_rights_roles_on_role_id_and_right_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "theme"
    t.integer  "site_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.text     "description"
    t.string   "group"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.text     "description"
    t.integer  "top_banner_id"
    t.integer  "top_banner_width"
    t.integer  "top_banner_height"
    t.integer  "body_width"
    t.text     "footer"
  end

  create_table "sites_csses", :force => true do |t|
    t.integer  "site_id",    :null => false
    t.integer  "css_id",     :null => false
    t.boolean  "publish"
    t.boolean  "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites_menus", :force => true do |t|
    t.integer  "site_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id",  :default => 0
    t.string   "side"
    t.integer  "position"
  end

  create_table "sites_pages", :force => true do |t|
    t.integer  "site_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "theme",               :default => "",    :null => false
    t.boolean  "status",              :default => false
    t.boolean  "is_admin",            :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "register"
  end

end
