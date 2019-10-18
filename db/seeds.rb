# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
Badge.delete_all
UsersBadge.delete_all
Gist.delete_all
Answer.delete_all
TestPassage.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

name = %w[Rails HTML JAVA]
images_path = 'badges/Badge_'
badge_title = ['Success pass all tests for the category',
               'Success pass for the first attempt',
               'Success pass all tests for the level']
badges = Badge.create!([
                         { title: badge_title[0], rule: Badge::RULES_NAME[0], rule_param: 'Rails', image: images_path + '01.png' },
                         { title: badge_title[1], rule: Badge::RULES_NAME[1], rule_param: 'no_param', image: images_path + '02.png' },
                         { title: badge_title[2], rule: Badge::RULES_NAME[2], rule_param: '1', image: images_path + '03.png' }
                       ])

categories = Category.create!([{ title: name[0] }, { title: name[1] }, { title: name[2] }])

admins = User.create!([
                        { first_name: 'Admin', last_name: 'Admin', email: 'dmlboxline@kaluga.ru', password: 'qqqqqq' },
                        { first_name: 'Jack', last_name: 'Black', email: 'a@a.a', password: 'qqqqqq' }
                      ])

tests_array = []
tests_array << { title: 'Rails basis', level: 1, category: categories[0], admin: admins[0] }
tests_array << { title: 'Rails Associations', level: 2, category: categories[0], admin: admins[0] }
tests_array << { title: 'Validations in Rails', level: 3, category: categories[0], admin: admins[0] }
tests_array << { title: 'HTML basis', level: 1, category: categories[1], admin: admins[0] }
tests_array << { title: 'HTML tags', level: 2, category: categories[1], admin: admins[0] }
tests_array << { title: 'HTML and CSS', level: 3, category: categories[1], admin: admins[0] }
tests_array << { title: 'JAVA basis', level: 1, category: categories[2], admin: admins[0] }
tests_array << { title: 'JAVA functions', level: 2, category: categories[2], admin: admins[0] }
tests_array << { title: 'JAVA and HTML', level: 3, category: categories[2], admin: admins[0] }
tests = Test.create!(tests_array)

questions_array = []
(0..8).each do |id|
  questions_array << { body: "question_#{id}:1", test: tests[id] }
  questions_array << { body: "question_#{id}:2", test: tests[id] }
  questions_array << { body: "question_#{id}:3", test: tests[id] }
  questions_array << { body: "question_#{id}:4", test: tests[id] }
end
questions = Question.create!(questions_array)

answer_array = []
(0..35).each do |id|
  answer_array << { body: "answer_#{id}:1", correct: false, question: questions[id] }
  answer_array << { body: "answer_#{id}:2", correct: false, question: questions[id] }
  answer_array << { body: "answer_#{id}:3", correct: false, question: questions[id] }
end
Answer.create!(answer_array)
