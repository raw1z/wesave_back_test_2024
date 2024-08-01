# frozen_string_literal: true

class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :label, null: false
      t.string :kind, null: false
      t.decimal :total_amount, null: false, default: 0.0

      t.timestamps
    end
  end
end
