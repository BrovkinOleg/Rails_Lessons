class BadgesService

  def initialize(test_passage)
    @user         = test_passage.user
    @test         = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.find_each do |badge|
      return get_badge(badge.rule) if send("passed_#{badge.title}?", badge.rule)
    end
  end

  private

  def get_badge(rule)
    Badge.find_by(rule: rule)
  end

  def passed_success_category?(title)
    return false if Category.find_by(title: title).nil?

    category_tests = Test.where(title: title).count
    ids = @user.tests.where(title: title).ids
    user_tests = success_tests.where(test_id: ids).count
    user_tests >= category_tests
  end

  def passed_success_on_first_try?(_no_param)
    TestPassage.where(user: @user, test: @test).count == 1 && @test_passage.success?
  end

  def passed_success_all_level?(level)
    level_tests = Test.where(level: level).count
    return false if level_tests == 0

    ids = @user.tests.where(level: level).ids
    user_tests = success_tests.where(test_id: ids).count
    user_tests >= level_tests
  end

  def success_tests
    @user.test_passages.where(success: true)
  end
end
