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

ActiveRecord::Schema[7.0].define(version: 2024_04_05_124212) do
  create_table "_litestream_lock", id: false, force: :cascade do |t|
    t.integer "id"
  end

  create_table "_litestream_seq", force: :cascade do |t|
    t.integer "seq"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_totals", force: :cascade do |t|
    t.integer "price"
    t.string "category_id"
    t.string "year_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_costs", force: :cascade do |t|
    t.date "pay_date"
    t.string "category_id"
    t.string "detail"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.integer "price"
    t.string "year_month"
    t.string "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "price"
    t.string "year_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthly_totals", force: :cascade do |t|
    t.integer "price"
    t.string "year_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
