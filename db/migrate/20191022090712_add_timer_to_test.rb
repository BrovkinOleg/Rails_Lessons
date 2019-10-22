class AddTimerToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer, :integer, default: 900
  end
end
