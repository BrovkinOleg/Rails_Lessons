# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
Answer.delete_all
TestPassage.delete_all
Question.delete_all
Test.delete_all
User.delete_all
Category.delete_all

categories = Category.create!([{ title: 'rails' }, { title: 'html' }, { title: 'java' }])

admins = User.create!([
                        { first_name: 'Admin', last_name: 'Admin', email: 'dmlboxline@kaluga.ru', password: 'qqqqqq' },
                        { first_name: 'Jack', last_name: 'Black', email: 'a@a.a', password: 'qqqqqq' }
                      ])

tests = Test.create!([
                       { title: 'Rails', level: 1, category: categories[0], admin: admins[0] },
                       { title: 'JAVA', level: 2, category: categories[2], admin: admins[0] }
                     ])

questions = Question.create!([
                               { body: 'question_1', test: tests[0] },
                               { body: 'question_2', test: tests[0] },
                               { body: 'question_3', test: tests[0] },
                               { body: 'question_4', test: tests[0] },
                               { body: 'question_5', test: tests[1] },
                               { body: 'question_6', test: tests[1] },
                               { body: 'question_7', test: tests[1] },
                               { body: 'question_8', test: tests[1] }
                             ])

Answer.create!([
                 { body: 'answer_11', correct: false, question: questions[0] },
                 { body: 'answer_12', correct: false, question: questions[0] },
                 { body: 'answer_21', correct: false, question: questions[1] },
                 { body: 'answer_22', correct: false, question: questions[1] },
                 { body: 'answer_31', correct: false, question: questions[2] },
                 { body: 'answer_32', correct: false, question: questions[2] },
                 { body: 'answer_41', correct: false, question: questions[3] },
                 { body: 'answer_42', correct: false, question: questions[3] },
                 { body: 'answer_51', correct: false, question: questions[4] },
                 { body: 'answer_52', correct: false, question: questions[4] },
                 { body: 'answer_61', correct: false, question: questions[5] },
                 { body: 'answer_62', correct: false, question: questions[5] },
                 { body: 'answer_71', correct: false, question: questions[6] },
                 { body: 'answer_72', correct: false, question: questions[6] },
                 { body: 'answer_81', correct: false, question: questions[7] },
                 { body: 'answer_82', correct: false, question: questions[7] }
               ])
