# frozen_string_literal: true

# You must delete tables in back order due to FOREIGN KEY
User.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all

Category.create(title: 'Rails')
Category.create(title: 'HTML')
Category.create(title: 'JAVA')

Test.create(title: 'Rails', level: 0, categories_id: Category.find_by_title('Rails').id)
Test.create(title: 'Rails', level: 1, categories_id: Category.find_by_title('Rails').id)
Test.create(title: 'Rails', level: 2, categories_id: Category.find_by_title('Rails').id)
Test.create(title: 'Rails', level: 3, categories_id: Category.find_by_title('Rails').id)
Test.create(title: 'HTML', level: 0, categories_id: Category.find_by_title('HTML').id)
Test.create(title: 'HTML', level: 1, categories_id: Category.find_by_title('HTML').id)
Test.create(title: 'HTML', level: 2, categories_id: Category.find_by_title('HTML').id)
Test.create(title: 'HTML', level: 3, categories_id: Category.find_by_title('HTML').id)
Test.create(title: 'JAVA', level: 0, categories_id: Category.find_by_title('JAVA').id)
Test.create(title: 'JAVA', level: 1, categories_id: Category.find_by_title('JAVA').id)
Test.create(title: 'JAVA', level: 2, categories_id: Category.find_by_title('JAVA').id)
Test.create(title: 'JAVA', level: 3, categories_id: Category.find_by_title('JAVA').id)

Question.create(body: 'question_01', tests_id: Test.find_by(title: 'Rails', level: 0).id)
Question.create(body: 'question_02', tests_id: Test.find_by(title: 'Rails', level: 1).id)
Question.create(body: 'question_03', tests_id: Test.find_by(title: 'Rails', level: 2).id)
Question.create(body: 'question_04', tests_id: Test.find_by(title: 'Rails', level: 3).id)
Question.create(body: 'question_05', tests_id: Test.find_by(title: 'HTML', level: 0).id)
Question.create(body: 'question_06', tests_id: Test.find_by(title: 'HTML', level: 1).id)
Question.create(body: 'question_07', tests_id: Test.find_by(title: 'HTML', level: 2).id)
Question.create(body: 'question_08', tests_id: Test.find_by(title: 'HTML', level: 3).id)
Question.create(body: 'question_09', tests_id: Test.find_by(title: 'JAVA', level: 0).id)
Question.create(body: 'question_10', tests_id: Test.find_by(title: 'JAVA', level: 1).id)
Question.create(body: 'question_11', tests_id: Test.find_by(title: 'JAVA', level: 2).id)
Question.create(body: 'question_12', tests_id: Test.find_by(title: 'JAVA', level: 3).id)

Answer.create(body: 'answer_01', questions_id: Question.find_by(body: 'question_01').id)
Answer.create(body: 'answer_02', questions_id: Question.find_by(body: 'question_02').id)
Answer.create(body: 'answer_03', questions_id: Question.find_by(body: 'question_03').id)
Answer.create(body: 'answer_04', questions_id: Question.find_by(body: 'question_04').id)
Answer.create(body: 'answer_05', questions_id: Question.find_by(body: 'question_05').id)
Answer.create(body: 'answer_06', questions_id: Question.find_by(body: 'question_06').id)
Answer.create(body: 'answer_07', questions_id: Question.find_by(body: 'question_07').id)
Answer.create(body: 'answer_08', questions_id: Question.find_by(body: 'question_08').id)
Answer.create(body: 'answer_09', questions_id: Question.find_by(body: 'question_09').id)
Answer.create(body: 'answer_10', questions_id: Question.find_by(body: 'question_10').id)
Answer.create(body: 'answer_11', questions_id: Question.find_by(body: 'question_11').id)
Answer.create(body: 'answer_12', questions_id: Question.find_by(body: 'question_12').id)

User.create(name: 'Admin')
User.create(name: 'Sara')
User.create(name: 'Jack')
User.create(name: 'Bill')
User.create(name: 'John')
User.create(name: 'John')
