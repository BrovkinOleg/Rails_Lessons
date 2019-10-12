class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    @all_user_tests_passages = @test_passage.where(user_id: @user.id)
    Badge.all.each do |b|
      reward(badge) if b.rule == 1 && all_tests_of_the_category_finished?
      reward(badge) if b.rule == 2 && first_try?
      reward(badge) if b.rule == 3 && all_tests_of_certain_level_finished?
    end
  end

  private

  def all_tests_of_certain_level_finished?
    # level_tests = Test.where(level: @test.level).count
    # user_level_tests_finished = TestPassage.where(user_id: @user.id, level: @test.category_id).count
  end

  def all_tests_of_the_category_finished?
    category_tests_count = Test.where(category_id: @test.category_id).count
    # user_category_tests_finished = TestPassage.where(user_id: @user.id). category_id: @test.category_id).count
    category_tests_count == user_category_tests_finished && successful_test?
  end

  def first_try?
    successful_test? && @user.tests.where(id: @test.id).count == 1
  end

  def reward(badge)
    @user.badges << badge
  end

  def successful_test?
    @test_passage.success?
  end

  def category_complete?(category)
    successful_test? && @test.category.title == category
  end

  def level_complete?(level)
    successful_test? && @test.level == level
  end
end
