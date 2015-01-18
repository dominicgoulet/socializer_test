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

ActiveRecord::Schema.define(version: 20150115170439) do

  create_table "socializer_activities", force: :cascade do |t|
    t.integer  "actor_id",           null: false
    t.integer  "activity_object_id", null: false
    t.integer  "target_id"
    t.integer  "verb_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "socializer_activities", ["activity_object_id"], name: "index_socializer_activities_on_activity_object_id"
  add_index "socializer_activities", ["actor_id"], name: "index_socializer_activities_on_actor_id"
  add_index "socializer_activities", ["target_id"], name: "index_socializer_activities_on_target_id"
  add_index "socializer_activities", ["verb_id"], name: "index_socializer_activities_on_verb_id"

  create_table "socializer_activity_fields", force: :cascade do |t|
    t.text     "content",     null: false
    t.integer  "activity_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "socializer_activity_fields", ["activity_id"], name: "index_socializer_activity_fields_on_activity_id"

  create_table "socializer_activity_objects", force: :cascade do |t|
    t.integer  "activitable_id",                         null: false
    t.string   "activitable_type",                       null: false
    t.integer  "like_count",                 default: 0
    t.integer  "unread_notifications_count", default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "socializer_activity_objects", ["activitable_type", "activitable_id"], name: "index_socializer_activity_objects_on_activitable"

  create_table "socializer_audiences", force: :cascade do |t|
    t.integer  "activity_id",        null: false
    t.integer  "activity_object_id"
    t.string   "privacy",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "socializer_audiences", ["activity_id", "activity_object_id"], name: "index_socializer_audiences_on_activity_id__activity_object_id", unique: true
  add_index "socializer_audiences", ["privacy"], name: "index_socializer_audiences_on_privacy"

  create_table "socializer_authentications", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_circles", force: :cascade do |t|
    t.integer  "author_id",    null: false
    t.string   "display_name", null: false
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "socializer_circles", ["author_id"], name: "index_socializer_circles_on_author_id"
  add_index "socializer_circles", ["display_name", "author_id"], name: "index_socializer_circles_on_display_name_and_author_id", unique: true

  create_table "socializer_comments", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "socializer_comments", ["author_id"], name: "index_socializer_comments_on_author_id"

  create_table "socializer_group_categories", force: :cascade do |t|
    t.integer  "group_id",     null: false
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "socializer_group_links", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.string   "label"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_groups", force: :cascade do |t|
    t.integer  "author_id",    null: false
    t.string   "display_name", null: false
    t.integer  "privacy",      null: false
    t.string   "tagline"
    t.text     "about"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "socializer_groups", ["author_id"], name: "index_socializer_groups_on_author_id"
  add_index "socializer_groups", ["display_name", "author_id"], name: "index_socializer_groups_on_display_name_and_author_id", unique: true
  add_index "socializer_groups", ["privacy"], name: "index_socializer_groups_on_privacy"

  create_table "socializer_identities", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "socializer_identities", ["email"], name: "index_socializer_identities_on_email", unique: true

  create_table "socializer_memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "member_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "socializer_memberships", ["group_id"], name: "index_socializer_memberships_on_group_id"
  add_index "socializer_memberships", ["member_id"], name: "index_socializer_memberships_on_member_id"

  create_table "socializer_notes", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "socializer_notes", ["author_id"], name: "index_socializer_notes_on_author_id"

  create_table "socializer_notifications", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "activity_object_id"
    t.boolean  "read",               default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "socializer_people", force: :cascade do |t|
    t.string   "display_name"
    t.string   "email"
    t.string   "language"
    t.string   "avatar_provider"
    t.string   "tagline"
    t.text     "introduction"
    t.string   "bragging_rights"
    t.string   "occupation"
    t.string   "skills"
    t.integer  "gender"
    t.boolean  "looking_for_friends"
    t.boolean  "looking_for_dating"
    t.boolean  "looking_for_relationship"
    t.boolean  "looking_for_networking"
    t.date     "birthdate"
    t.integer  "relationship"
    t.string   "other_names"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "socializer_person_addresses", force: :cascade do |t|
    t.integer  "person_id",          null: false
    t.integer  "category"
    t.integer  "label"
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "postal_code_or_zip"
    t.string   "province_or_state"
    t.string   "country"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "socializer_person_contributions", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "label"
    t.string   "url"
    t.boolean  "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_person_educations", force: :cascade do |t|
    t.integer  "person_id",               null: false
    t.string   "school_name"
    t.string   "major_or_field_of_study"
    t.date     "started_on"
    t.date     "ended_on"
    t.boolean  "current"
    t.text     "courses_description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "socializer_person_employments", force: :cascade do |t|
    t.integer  "person_id",       null: false
    t.string   "employer_name"
    t.string   "job_title"
    t.date     "started_on"
    t.date     "ended_on"
    t.boolean  "current"
    t.text     "job_description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "socializer_person_links", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "label"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_person_phones", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.integer  "category",   null: false
    t.integer  "label",      null: false
    t.string   "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_person_places", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "city_name"
    t.boolean  "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_person_profiles", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "label"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socializer_ties", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "socializer_ties", ["circle_id"], name: "index_socializer_ties_on_circle_id"
  add_index "socializer_ties", ["contact_id"], name: "index_socializer_ties_on_contact_id"

  create_table "socializer_verbs", force: :cascade do |t|
    t.string   "display_name", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "socializer_verbs", ["display_name"], name: "index_socializer_verbs_on_display_name", unique: true

end
