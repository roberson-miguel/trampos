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

ActiveRecord::Schema.define(version: 2019_12_23_085332) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "benefits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.text "comment"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "joblevels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "workplace"
    t.date "end_date"
    t.boolean "favorite"
    t.integer "salary_range"
    t.integer "company_id"
    t.integer "skill_id"
    t.integer "benefit_id"
    t.integer "joblevel_id"
    t.integer "user_id"
    t.string "email"
    t.integer "status"
    t.index ["benefit_id"], name: "index_jobs_on_benefit_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["joblevel_id"], name: "index_jobs_on_joblevel_id"
    t.index ["skill_id"], name: "index_jobs_on_skill_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "profile_jobs", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comments"
  end

  create_table "profilejobs", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "social_name"
    t.string "address"
    t.string "cellphone"
    t.date "date_birth"
    t.integer "languages"
    t.integer "education_level"
    t.integer "education_status"
    t.string "education_institution"
    t.string "education_course"
    t.date "education_end_date"
    t.string "experience_company"
    t.text "experience_reponsibility"
    t.string "experience_role"
    t.integer "joblevel_id"
    t.integer "skill_id"
    t.date "experience_start_date"
    t.date "experience_end_date"
    t.boolean "experience_current_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["joblevel_id"], name: "index_profiles_on_joblevel_id"
    t.index ["skill_id"], name: "index_profiles_on_skill_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
