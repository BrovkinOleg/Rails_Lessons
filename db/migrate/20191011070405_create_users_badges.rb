class CreateUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :users_badges do |t|
      t.integer :user_id, index: true
      t.integer :badge_id

      t.timestamps
    end
  end
end
