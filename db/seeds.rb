# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
Answer.delete_all
Question.delete_all
UsersTest.delete_all
Test.delete_all
Category.delete_all
User.delete_all

categories = Category.create!([{ title: 'rails' }, { title: 'html' }, { title: 'java' }])

users = User.create!([
                       { name: 'Admin' },
                       { name: 'Sara' },
                       { name: 'Jack' },
                       { name: 'Bill' },
                       { name: 'John' }
                     ])

tests = Test.create!([
                       { title: 'Rails_novice', level: 0, categories_id: categories[0].id },
                       { title: 'Rails_junior', level: 1, categories_id: categories[0].id },
                       { title: 'Rails_middle', level: 2, categories_id: categories[0].id },
                       { title: 'Rails_senior', level: 3, categories_id: categories[0].id },
                       { title: 'HTML_novice', level: 0, categories_id: categories[1].id },
                       { title: 'HTML_middle', level: 1, categories_id: categories[1].id },
                       { title: 'HTML_middle', level: 2, categories_id: categories[1].id },
                       { title: 'HTML_senior', level: 3, categories_id: categories[1].id },
                       { title: 'JAVA_novice', level: 0, categories_id: categories[2].id },
                       { title: 'JAVA_middle', level: 1, categories_id: categories[2].id },
                       { title: 'JAVA_middle', level: 2, categories_id: categories[2].id },
                       { title: 'JAVA_senior', level: 3, categories_id: categories[2].id }
                     ])

users_tests = UsersTest.create!([
                                  { users_id: users[0].id, tests_id: tests[0].id },
                                  { users_id: users[0].id, tests_id: tests[1].id },
                                  { users_id: users[0].id, tests_id: tests[2].id },
                                  { users_id: users[0].id, tests_id: tests[3].id },
                                  { users_id: users[0].id, tests_id: tests[4].id },
                                  { users_id: users[1].id, tests_id: tests[2].id },
                                  { users_id: users[1].id, tests_id: tests[3].id },
                                  { users_id: users[1].id, tests_id: tests[4].id },
                                  { users_id: users[2].id, tests_id: tests[4].id },
                                  { users_id: users[2].id, tests_id: tests[5].id },
                                  { users_id: users[2].id, tests_id: tests[6].id }
                                ])

questions = Question.create!([
                               { body: 'question_01', tests_id: tests[0].id },
                               { body: 'question_02', tests_id: tests[1].id },
                               { body: 'question_03', tests_id: tests[2].id },
                               { body: 'question_04', tests_id: tests[3].id },
                               { body: 'question_05', tests_id: tests[4].id },
                               { body: 'question_06', tests_id: tests[5].id },
                               { body: 'question_07', tests_id: tests[6].id },
                               { body: 'question_08', tests_id: tests[7].id },
                               { body: 'question_09', tests_id: tests[8].id },
                               { body: 'question_10', tests_id: tests[9].id },
                               { body: 'question_11', tests_id: tests[10].id },
                               { body: 'question_12', tests_id: tests[11].id }
                             ])

Answer.create!([
                 { body: 'answer_01', questions_id: questions[0].id },
                 { body: 'answer_02', questions_id: questions[1].id },
                 { body: 'answer_03', questions_id: questions[2].id },
                 { body: 'answer_04', questions_id: questions[3].id },
                 { body: 'answer_05', questions_id: questions[4].id },
                 { body: 'answer_06', questions_id: questions[5].id },
                 { body: 'answer_07', questions_id: questions[6].id },
                 { body: 'answer_08', questions_id: questions[7].id },
                 { body: 'answer_09', questions_id: questions[8].id },
                 { body: 'answer_10', questions_id: questions[9].id },
                 { body: 'answer_11', questions_id: questions[10].id },
                 { body: 'answer_11', questions_id: questions[10].id }
               ])
