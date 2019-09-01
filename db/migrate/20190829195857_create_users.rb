class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end

  def tests_list(complexity_level, user_name)
    test_array = Test.where('level == ?', complexity_level)
    user_array = User.where('title == ?', user_name)
    test_titles = []
    test_array.each do |test|
      test_titles << test.title.to_s + test.level.to_s \
        if test_array.id == user_array.test_id
    end
    test_titles
  end
end
