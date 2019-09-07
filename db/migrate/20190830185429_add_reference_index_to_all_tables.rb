class AddReferenceIndexToAllTables < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tests, :category, foreign_key: true)
    add_reference(:questions, :test, foreign_key: true)
    add_reference(:answers, :question, foreign_key: true)
    add_reference(:tests, :admin, foreign_key: { to_table: :users })
  end
end
