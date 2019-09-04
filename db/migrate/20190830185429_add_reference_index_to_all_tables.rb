class AddReferenceIndexToAllTables < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :category, foreign_key: true)
    add_reference(:tests, :questions, foreign_key: true)
    add_reference(:questions, :test, foreign_key: true)
    add_reference(:answers, :question, foreign_key: true)
    add_reference(:users_tests, :tests, foreign_key: true)
    add_reference(:users_tests, :users, foreign_key: true)
  end
end
