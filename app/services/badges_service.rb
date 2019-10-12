class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    reward(Badge.first)
    # @user_passages = TestPassage.where(user_id: @user.id, success: true)
    # return if @user_passages.nil?
    # byebug
    # category_tests_finished? unless Badge.where(rule: 1).nil?
    # first_try? unless Badge.where(rule: 2).nil?
    # level_tests_finished? unless Badge.where(rule: 3).nil?
    # Badge.all.each do |b|
    #   reward(badge) if b.rule == 1 && category_tests_finished?
    #   reward(badge) if b.rule == 2 && first_try?
    #   reward(badge) if b.rule == 3 && level_tests_finished?
    # end
  end

  private

  def category_tests_finished?
    # byebug
    category_tests_count = Test.where(category_id: @user.test.category_id).count
    user_category_tests_finished = @user_passages.where(category_id: @user.test.category_id).count
    reward(Badge.where(rule: 1)) if user_category_tests_finished >= category_tests_count && successful_test?
  end

  def first_try?
    # @user.tests.where(id: @test.id).count == 1 && successful_test?
    reward(Badge.where(rule: 2)) if @user_passages.tests.count == 1 && successful_test?
  end

  def level_tests_finished?
    level_tests = Test.where(level: @test.level).count
    user_level_tests_finished = @user_passages.test.where(level: @test.level).count
    reward(Badge.where(rule: 3)) if user_level_tests_finished >= level_tests && successful_test?
  end

  def reward(badge)
    @user.badges << badge
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
