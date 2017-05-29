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

ActiveRecord::Schema.define(version: 20170426065226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.string   "name"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "sound_file_name"
    t.string   "sound_content_type"
    t.integer  "sound_file_size"
    t.datetime "sound_updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialogs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialogs_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dialog_id"
    t.index ["dialog_id"], name: "index_dialogs_users_on_dialog_id", using: :btree
    t.index ["user_id"], name: "index_dialogs_users_on_user_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "friends_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.index ["friend_id"], name: "index_friends_users_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friends_users_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "photos_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "photo_id"
    t.text     "description"
    t.index ["photo_id"], name: "index_groups_on_photo_id", using: :btree
    t.index ["photos_id"], name: "index_groups_on_photos_id", using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message_text"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dialog_id"
    t.index ["dialog_id"], name: "index_messages_on_dialog_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_streets_on_city_id", using: :btree
  end

  create_table "user_to_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "groups_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groups_id"], name: "index_user_to_groups_on_groups_id", using: :btree
    t.index ["user_id"], name: "index_user_to_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.text     "preference"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "sex"
    t.integer  "photo_id"
    t.integer  "street_id"
    t.string   "house"
    t.string   "apartment"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["photo_id"], name: "index_users_on_photo_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["street_id"], name: "index_users_on_street_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

end
