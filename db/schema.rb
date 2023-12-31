# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_01_233807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "expected_result_type", ["success", "failure"]
  create_enum "persona_type", ["admin", "user"]

  create_table "things", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "executed_on"
    t.datetime "concieved_of_at"
    t.time "will_be_at"
    t.enum "persona", enum_type: "persona_type"
    t.string "forecast"
    t.integer "user_id"
    t.date "when_at"
    t.text "background_details"
    t.enum "expected_result", enum_type: "expected_result_type"
    t.boolean "will_call"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aaa"
    t.integer "bbb"
    t.text "ccc"
    t.date "ddd"
    t.datetime "eee"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
