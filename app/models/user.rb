class User < ApplicationRecord

  def tests_list_show(complexity_level)
    Test.where('level = ?', complexity_level)
  end
  # ТЗ: "возвращает список всех Тестов, которые проходит или
  # когда-либо проходил Пользователь на этом уровне сложности"
  # должна быть привязка не только к уровню , но и к пользователю

  # def find_tests_by_level(test_level)
  #   Test.joins('join user_tests on user_tests.tests_id = tests.id').where(passed_tests: { user_id: id }, level: test_level)
  # end
end
