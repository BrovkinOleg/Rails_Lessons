class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @this_user = test_passage.user
    @this_test = test_passage.test
    @this_level = @this_test.level
    @category = @this_test.category.title
    @user_passages = @this_user.test_passages
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if badge.rule == 1 && category_tests_finished?
      reward(badge) if badge.rule == 2 && first_try?
      reward(badge) if badge.rule == 3 && level_tests_finished?
    end
  end

  private

  def category_tests_finished?
    all_category_tests_count = Test.where(title: @category).count
    user_category_tests_finished = @this_user.tests.where(title: @category).count
    successful_test? && user_category_tests_finished == all_category_tests_count
  end

  def first_try?
    successful_test? && @this_user.tests.where(title: @category, level: @this_level).count == 1
  end

  def level_tests_finished?
    all_level_tests = Test.where(level: @this_level).count
    user_level_tests_finished = @this_user.tests.where(level: @this_level).count
    successful_test? && user_level_tests_finished == all_level_tests
  end

  def reward(badge)
    @this_user.badges << badge
  end

  def successful_test?
    @test_passage.success
  end

  def category_complete?(category)
    successful_test? && @test.category.title == category
  end

  def level_complete?(level)
    successful_test? && @test.level == level
  end
end
