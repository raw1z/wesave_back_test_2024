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

ActiveRecord::Schema[7.1].define(version: 2024_08_01_150544) do
  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.string "isin", null: false
    t.string "kind", null: false
    t.string "label", null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "sri", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isin"], name: "index_investments_on_isin", unique: true
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "amount", default: "0.0", null: false
    t.integer "portfolio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_id"
    t.index ["portfolio_id"], name: "index_operations_on_portfolio_id"
  end

  create_table "portfolio_investments", force: :cascade do |t|
    t.integer "portfolio_id", null: false
    t.integer "investment_id", null: false
    t.decimal "amount", default: "0.0", null: false
    t.decimal "share", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investment_id"], name: "index_portfolio_investments_on_investment_id"
    t.index ["portfolio_id", "investment_id"], name: "index_portfolio_investments_on_portfolio_id_and_investment_id", unique: true
    t.index ["portfolio_id"], name: "index_portfolio_investments_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "label", null: false
    t.string "kind", null: false
    t.decimal "total_amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_portfolios_on_customer_id"
  end

  add_foreign_key "operations", "portfolios"
  add_foreign_key "portfolio_investments", "investments"
  add_foreign_key "portfolio_investments", "portfolios"
  add_foreign_key "portfolios", "customers"
end
