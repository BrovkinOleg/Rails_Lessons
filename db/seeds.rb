# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
Admin.delete_all
Answer.delete_all
TestPassage.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

categories = Category.create!([{ title: 'rails' }, { title: 'html' }, { title: 'java' }])

users = User.create!([
                       { email: 'Admin@thinknetica.ru', password: 'admin0' },
                       { email: 'Sara@thinknetica.ru', password: 'sara00' },
                       { email: 'Jack@thinknetica.ru', password: 'jack00' },
                       { email: 'Bill@thinknetica.ru', password: 'bill00' },
                       { email: 'John@thinknetica.ru', password: 'john00' }
                     ])

tests = Test.create!([
                       { title: 'Rails_novice', level: 0, category: categories[0], admin: users[0] },
                       { title: 'Rails_junior', level: 1, category: categories[0], admin: users[0] },
                       { title: 'Rails_middle', level: 2, category: categories[0], admin: users[0] },
                       { title: 'Rails_senior', level: 3, category: categories[0], admin: users[0] },
                       { title: 'HTML_novice', level: 0, category: categories[1], admin: users[0] },
                       { title: 'HTML_junior', level: 1, category: categories[1], admin: users[0] },
                       { title: 'HTML_middle', level: 2, category: categories[1], admin: users[0] },
                       { title: 'HTML_senior', level: 3, category: categories[1], admin: users[0] },
                       { title: 'JAVA_novice', level: 0, category: categories[2], admin: users[0] },
                       { title: 'JAVA_junior', level: 1, category: categories[2], admin: users[0] },
                       { title: 'JAVA_middle', level: 2, category: categories[2], admin: users[0] },
                       { title: 'JAVA_senior', level: 3, category: categories[2], admin: users[0] }
                     ])

questions = Question.create!([
                               { body: 'question_01', test: tests[0] },
                               { body: 'question_02', test: tests[0] },
                               { body: 'question_03', test: tests[0] },
                               { body: 'question_04', test: tests[3] },
                               { body: 'question_05', test: tests[4] },
                               { body: 'question_06', test: tests[5] },
                               { body: 'question_07', test: tests[6] },
                               { body: 'question_08', test: tests[7] },
                               { body: 'question_09', test: tests[8] },
                               { body: 'question_10', test: tests[9] },
                               { body: 'question_11', test: tests[10] },
                               { body: 'question_12', test: tests[11] }
                             ])

Answer.create!([
                 { body: 'answer_01', question: questions[0] },
                 { body: 'answer_02', question: questions[1] },
                 { body: 'answer_03', question: questions[2] },
                 { body: 'answer_04', question: questions[3] },
                 { body: 'answer_05', question: questions[4] },
                 { body: 'answer_06', question: questions[5] },
                 { body: 'answer_07', question: questions[6] },
                 { body: 'answer_08', question: questions[7] },
                 { body: 'answer_09', question: questions[8] },
                 { body: 'answer_10', question: questions[9] },
                 { body: 'answer_11', question: questions[10] },
                 { body: 'answer_12', question: questions[11] }
               ])

tests_users = TestPassage.create!([
                                    { user: users[0], test: tests[0], current_question: questions[0] },
                                    { user: users[1], test: tests[1], current_question: questions[1] },
                                    { user: users[2], test: tests[2], current_question: questions[2] },
                                    { user: users[3], test: tests[3], current_question: questions[3] },
                                    { user: users[4], test: tests[4], current_question: questions[4] },
                                    { user: users[0], test: tests[5], current_question: questions[5] },
                                    { user: users[1], test: tests[6], current_question: questions[6] },
                                    { user: users[2], test: tests[7], current_question: questions[7] },
                                    { user: users[3], test: tests[8], current_question: questions[8] },
                                    { user: users[4], test: tests[9], current_question: questions[9] },
                                    { user: users[0], test: tests[10], current_question: questions[10] },
                                    { user: users[1], test: tests[11], current_question: questions[11] }
                                  ])
Admin.create!([
                { email: 'a@a.a', password: 'aaaaaa', first_name: 'Oleg', last_name: 'Brov' }
              ])