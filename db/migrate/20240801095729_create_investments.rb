# frozen_string_literal: true

class CreateInvestments < ActiveRecord::Migration[7.1]
  def change
    create_table :investments do |t|
      t.string :isin, null: false
      t.string :kind, null: false
      t.string :label, null: false
      t.decimal :price, null: false, default: 0.0
      t.integer :sri, null: false, default: 0

      t.timestamps
    end
  end
end
