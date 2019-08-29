class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.integer :users_id
      t.integer :questions_id

      t.timestamps
    end
  end
end
