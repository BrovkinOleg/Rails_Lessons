class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level

      t.timestamps
    end
  end

  def self.tests_array(category)
    line = Category.find_by_title(title: category)
    array = Test.where('? == ?', line.id, Test.categories_id)
    array = array.order('id DESC')
    test_titles = []
    array.each { |test| test_titles << test.title }
  end
end
