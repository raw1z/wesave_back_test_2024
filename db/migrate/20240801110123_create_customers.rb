# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.timestamps
    end

    add_reference :portfolios, :customer, null: false, foreign_key: true
  end
end
