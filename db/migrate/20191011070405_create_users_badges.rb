class CreateUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :users_badges do |t|
      t.integer :user_id, index: true
      t.integer :badge_id, index: true
      t.integer :image_id
      t.string :name

      t.timestamps
    end
  end
end
