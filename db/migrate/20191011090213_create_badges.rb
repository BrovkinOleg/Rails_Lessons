class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.integer :rule, null: false
      t.string :image

      t.timestamps
    end
  end
end
