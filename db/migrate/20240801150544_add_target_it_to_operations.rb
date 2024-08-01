# frozen_string_literal: true

class AddTargetItToOperations < ActiveRecord::Migration[7.1]
  def change
    add_column :operations, :target_id, :integer
  end
end
