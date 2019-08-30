# frozen_string_literal: true

# add foreign key for all tables
class AddReferenceIndexToAllTables < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :categories, index: true, foreign_key: true)
    add_reference(:questions, :tests, index: true, foreign_key: true)
    add_reference(:users, :categories, index: true, foreign_key: true)
  end
end
