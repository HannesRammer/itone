# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100308213414) do

  create_table "body_parts", :force => true do |t|
    t.string "name"
  end

  create_table "exercise_to_muscles", :force => true do |t|
    t.integer "muscle_id"
    t.integer "exercise_id"
    t.integer "body_part_id"
    t.string  "muscle_type"
    t.boolean "active"
  end

  create_table "exercises", :force => true do |t|
    t.string "name"
    t.string "image1"
    t.text   "description"
    t.string "image2"
    t.text   "main_description"
    t.text   "how_to"
    t.text   "how_not_to"
    t.text   "info"
    t.string "exercise_type"
  end

  create_table "muscles", :force => true do |t|
    t.text    "name",       :limit => 16777215
    t.integer "picture_id"
  end

  create_table "user_to_exercises", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
