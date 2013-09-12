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

ActiveRecord::Schema.define(:version => 20130617233824) do

  create_table "cached_models", :force => true do |t|
    t.string "name"
    t.string "type"
    t.string "cached_tag_list"
  end

  create_table "non_standard_id_taggable_models", :primary_key => "an_id", :force => true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "ordered_taggable_models", :force => true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "other_cached_models", :force => true do |t|
    t.string "name"
    t.string "type"
    t.string "cached_language_list"
    t.string "cached_status_list"
    t.string "cached_glass_list"
  end

  create_table "other_taggable_models", :force => true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "votes_count"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "taggable_models", :force => true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "untaggable_models", :force => true do |t|
    t.integer "taggable_model_id"
    t.string  "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "story_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

end