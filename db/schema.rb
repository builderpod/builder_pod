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

ActiveRecord::Schema.define(version: 2019_08_07_204627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "contractor_id"
    t.decimal "amount"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["contractor_id"], name: "index_bids_on_contractor_id"
    t.index ["task_id"], name: "index_bids_on_task_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "oid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractor_categories", force: :cascade do |t|
    t.bigint "contractor_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_contractor_categories_on_category_id"
    t.index ["contractor_id"], name: "index_contractor_categories_on_contractor_id"
  end

  create_table "contractor_task_profiles", force: :cascade do |t|
    t.bigint "contractor_id"
    t.bigint "task_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_task_profiles_on_contractor_id"
    t.index ["task_profile_id"], name: "index_contractor_task_profiles_on_task_profile_id"
  end

  create_table "contractor_tasks", force: :cascade do |t|
    t.bigint "contractor_id"
    t.bigint "task_id"
    t.date "start"
    t.date "end"
    t.decimal "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_tasks_on_contractor_id"
    t.index ["task_id"], name: "index_contractor_tasks_on_task_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.integer "haid"
    t.string "name"
    t.string "website"
    t.text "description"
    t.float "rating"
    t.integer "review_count"
    t.string "telephone"
    t.string "street_address"
    t.string "locality"
    t.string "region"
    t.string "postal_code"
    t.bigint "user_id"
    t.float "longitude"
    t.float "latitude"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "locality"
    t.text "region"
    t.text "postal_code"
    t.float "longitude"
    t.float "latitude"
    t.text "street_address"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "task_profiles", force: :cascade do |t|
    t.bigint "oid"
    t.text "name"
    t.text "description"
    t.text "xm_descriptor"
    t.boolean "matchable"
    t.boolean "profileable"
    t.bigint "es_score"
    t.bigint "default_cost_guide_id"
    t.text "keywords"
    t.text "text_messaging_name"
    t.text "rollover_long_desc"
    t.text "rollover_short_desc"
    t.text "sector_id"
    t.text "meta_description"
    t.text "html_title"
    t.text "content_description"
    t.bigint "pwc_id"
    t.bigint "accept_goal"
    t.boolean "multi_zip"
    t.bigint "pre_match_type_id"
    t.bigint "bridge_oid"
    t.text "bridge_text"
    t.text "bridge_link_text"
    t.bigint "bridge_link_id"
    t.text "bridge_active"
    t.text "xm_name"
    t.bigint "redirect_to_oid"
    t.text "sp_display_name"
    t.text "xm_header_descriptor"
    t.text "url_name"
    t.bigint "consideration_id"
    t.text "search_keywords"
    t.bigint "emc_category_oid"
    t.bigint "primary_question_set_id"
    t.boolean "location_specific"
    t.boolean "commercial"
    t.boolean "view_first_parent_task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_task_profiles_on_category_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_profile_id"
    t.jsonb "responses", default: "{}", null: false
    t.float "longitude"
    t.float "latitude"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["responses"], name: "index_tasks_on_responses", using: :gin
    t.index ["task_profile_id"], name: "index_tasks_on_task_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bids", "contractors"
  add_foreign_key "bids", "tasks"
  add_foreign_key "contractor_categories", "categories"
  add_foreign_key "contractor_categories", "contractors"
  add_foreign_key "contractor_task_profiles", "contractors"
  add_foreign_key "contractor_task_profiles", "task_profiles"
  add_foreign_key "contractor_tasks", "contractors"
  add_foreign_key "contractor_tasks", "tasks"
  add_foreign_key "contractors", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "services", "users"
  add_foreign_key "task_profiles", "categories"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "task_profiles"
end
