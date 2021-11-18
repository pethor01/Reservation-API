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

ActiveRecord::Schema.define(version: 2021_11_17_105842) do

  create_table "guest_details", force: :cascade do |t|
    t.integer "number_of_guests"
    t.integer "adults"
    t.integer "children"
    t.integer "infants"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_numbers"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "guest_detail_id"
    t.date "start_date"
    t.date "end_date"
    t.string "currency", null: false
    t.integer "nights"
    t.string "status"
    t.decimal "total_paid_amount", null: false
    t.decimal "payout_amount"
    t.decimal "security_amount"
    t.decimal "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_detail_id"], name: "index_reservations_on_guest_detail_id"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
  end

end
