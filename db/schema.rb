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

ActiveRecord::Schema.define(version: 20170806094459) do

  create_table "hints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "stage_id"
    t.text     "description", limit: 65535
    t.string   "img_url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["stage_id"], name: "index_hints_on_stage_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "stage_id"
    t.string   "stage_type"
    t.string   "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_images_on_stage_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "recipient_id"
    t.integer  "player_id"
    t.string   "action"
    t.integer  "stage_num"
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "theme_id"
    t.integer  "stage_num",      default: 1
    t.integer  "hint_count",     default: 3
    t.integer  "team_player_id"
    t.string   "team_type"
    t.string   "clear_list"
    t.datetime "start_time"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["theme_id"], name: "index_players_on_theme_id", using: :btree
  end

  create_table "stages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "theme_id"
    t.string   "stage_type"
    t.integer  "stage_num"
    t.string   "password_digest"
    t.float    "gps_x",           limit: 24
    t.float    "gps_y",           limit: 24
    t.text     "description",     limit: 65535
    t.string   "img_url",                       default: ""
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["theme_id"], name: "index_stages_on_theme_id", using: :btree
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",  limit: 65535
    t.integer  "difficulty"
    t.integer  "price"
    t.integer  "playtime"
    t.integer  "player_count"
    t.string   "img_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "hints", "stages"
  add_foreign_key "images", "stages"
  add_foreign_key "players", "themes"
  add_foreign_key "stages", "themes"
end
