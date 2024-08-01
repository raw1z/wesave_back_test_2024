# frozen_string_literal: true

class AddUniqueIndexOnIsinForInvestments < ActiveRecord::Migration[7.1]
  def change
    add_index :investments, :isin, unique: true
  end
end
