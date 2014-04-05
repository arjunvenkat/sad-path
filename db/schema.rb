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

ActiveRecord::Schema.define(version: 20140405000222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_list_items", force: true do |t|
    t.integer  "check_list_id"
    t.integer  "check_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checks", force: true do |t|
    t.string   "description"
    t.string   "input_label"
    t.text     "input_example"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "more_info"
  end

  create_table "course_check_lists", force: true do |t|
    t.integer  "course_id"
    t.integer  "check_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_topic_id"
    t.string   "enrollment_hash"
    t.integer  "selected_course_check_list_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "instructor", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roadblock_checks", force: true do |t|
    t.integer  "check_id"
    t.integer  "roadblock_id"
    t.datetime "completed_at", default: '1970-01-01 00:00:00'
    t.boolean  "solved_it",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "user_input"
    t.integer  "position"
    t.boolean  "completed"
  end

  create_table "roadblocks", force: true do |t|
    t.string   "error_message"
    t.text     "code_snippet"
    t.text     "description"
    t.text     "solution"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "topic_id"
    t.boolean  "solved",               default: false
    t.boolean  "need_help",            default: false
    t.integer  "enrollment_id"
    t.integer  "second_enrollment_id"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
