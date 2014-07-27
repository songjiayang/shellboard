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

ActiveRecord::Schema.define(version: 20140727032631) do

  create_table "job_subs", force: true do |t|
    t.string   "email"
    t.integer  "language"
    t.boolean  "confirm"
    t.string   "confirm_token"
    t.boolean  "enable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_subs", ["confirm"], name: "index_job_subs_on_confirm", using: :btree
  add_index "job_subs", ["email", "confirm_token", "language"], name: "index_job_subs_on_email_and_confirm_token_and_language", unique: true, using: :btree
  add_index "job_subs", ["enable"], name: "index_job_subs_on_enable", using: :btree
  add_index "job_subs", ["language"], name: "index_job_subs_on_language", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.integer  "job_type"
    t.string   "company_name"
    t.integer  "occupation"
    t.string   "location"
    t.text     "description"
    t.text     "apply_information"
    t.date     "deadline"
    t.integer  "aasm_state"
    t.integer  "city"
    t.string   "identifier"
    t.string   "url"
    t.integer  "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
