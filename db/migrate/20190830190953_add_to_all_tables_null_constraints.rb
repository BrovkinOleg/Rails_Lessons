class AddToAllTablesNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, from: true, to: false)
    change_column_null(:tests, :title, from: true, to: false)
    change_column_null(:tests, :level, from: true, to: false)
    change_column_null(:questions, :body, from: true, to: false)
    change_column_null(:answers, :body, from: true, to: false)
    change_column_null(:answers, :correct, from: true, to: false)
    change_column_null(:users, :name, from: true, to: false)
  end
end
