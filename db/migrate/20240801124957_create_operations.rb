# frozen_string_literal: true

class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.decimal :amount, null: false, default: 0.0
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
