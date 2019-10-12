# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
UsersBadge.delete_all
TestPassage.delete_all
Gist.delete_all
Answer.delete_all
TestPassage.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

name = %w[Rails HTML JAVA]

categories = Category.create!([{ title: name[0] }, { title: name[1] }, { title: name[2] }])

admins = User.create!([
                        { first_name: 'Admin', last_name: 'Admin', email: 'dmlboxline@kaluga.ru', password: 'qqqqqq' },
                        { first_name: 'Jack', last_name: 'Black', email: 'a@a.a', password: 'qqqqqq' }
                      ])

tests_array = []
(0..2).each do |id|
  tests_array << { title: name[id], level: 1, category: categories[id], admin: admins[0] }
  tests_array << { title: name[id], level: 2, category: categories[id], admin: admins[0] }
  tests_array << { title: name[id], level: 3, category: categories[id], admin: admins[0] }
end
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

