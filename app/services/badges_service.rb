class BadgesService

  def initialize(test_passage)
    @user         = test_passage.user
    @test         = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.select { |badge| send("passed_#{badge.rule}?", badge.rule_param) }
  end

  private

  def passed_success_category?(param)
    return if @test.category.title != param

    ids = Test.joins(:category).where(categories: { title: param }).ids
    @test_passage.success? && @user.test_passages.where(test_id: ids).uniq.count >= ids.count
  end

  def passed_success_on_first_try?(_no_param)
    @test_passage.success? && @user.test_passages.where(test: @test).count == 1
  end

  def passed_success_all_level?(param)
    return if @test.level.to_s != param

    ids = Test.where(level: param).ids
    @test_passage.success? && @user.test_passages.where(test_id: ids).uniq.count >= ids.count
  end
end
