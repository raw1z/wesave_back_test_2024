# frozen_string_literal: true

class CreatePortfolioInvestments < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolio_investments do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :investment, null: false, foreign_key: true
      t.decimal :amount, null: false, default: 0.0
      t.decimal :share, null: false, default: 0.0

      t.timestamps
    end

    # a porfolio can only invest once in an investment
    add_index :portfolio_investments, [:portfolio_id, :investment_id], unique: true
  end
end
