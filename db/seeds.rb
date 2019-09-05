# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
Answer.delete_all
Question.delete_all
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
                       { title: 'Rails_novice', level: 0, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Rails_junior', level: 1, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Rails_middle', level: 2, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Rails_senior', level: 3, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'HTML_novice', level: 0, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'HTML_middle', level: 1, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'HTML_middle', level: 2, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'HTML_senior', level: 3, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'JAVA_novice', level: 0, category_id: categories[2].id, user_id: users[0].id },
                       { title: 'JAVA_middle', level: 1, category_id: categories[2].id, user_id: users[0].id },
                       { title: 'JAVA_middle', level: 2, category_id: categories[2].id, user_id: users[0].id },
                       { title: 'JAVA_senior', level: 3, category_id: categories[2].id, user_id: users[0].id }
                     ])

User.find(1).tests.push(Test.find(1))
User.find(2).tests.push(Test.find(2))
User.find(3).tests.push(Test.find(3))
User.find(4).tests.push(Test.find(4))
User.find(5).tests.push(Test.find(5))

Test.find(1).users.push(User.find(5))
Test.find(2).users.push(User.find(4))
Test.find(3).users.push(User.find(3))
Test.find(4).users.push(User.find(2))
Test.find(5).users.push(User.find(1))

questions = Question.create!([
                               { body: 'question_01', test_id: tests[0].id },
                               { body: 'question_02', test_id: tests[1].id },
                               { body: 'question_03', test_id: tests[2].id },
                               { body: 'question_04', test_id: tests[3].id },
                               { body: 'question_05', test_id: tests[4].id },
                               { body: 'question_06', test_id: tests[5].id },
                               { body: 'question_07', test_id: tests[6].id },
                               { body: 'question_08', test_id: tests[7].id },
                               { body: 'question_09', test_id: tests[8].id },
                               { body: 'question_10', test_id: tests[9].id },
                               { body: 'question_11', test_id: tests[10].id },
                               { body: 'question_12', test_id: tests[11].id }
                             ])

Answer.create!([
                 { body: 'answer_01', question_id: questions[0].id },
                 { body: 'answer_02', question_id: questions[1].id },
                 { body: 'answer_03', question_id: questions[2].id },
                 { body: 'answer_04', question_id: questions[3].id },
                 { body: 'answer_05', question_id: questions[4].id },
                 { body: 'answer_06', question_id: questions[5].id },
                 { body: 'answer_07', question_id: questions[6].id },
                 { body: 'answer_08', question_id: questions[7].id },
                 { body: 'answer_09', question_id: questions[8].id },
                 { body: 'answer_10', question_id: questions[9].id },
                 { body: 'answer_11', question_id: questions[10].id },
                 { body: 'answer_11', question_id: questions[10].id }
               ])
