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

    mark = 0x01 # for not repeated usage in TestPassages
    ids = Test.joins(:category).where(categories: { title: param }).ids
    used_passages = @user.test_passages.where(test_id: ids).uniq
    used = used_passages.select { |pass| (pass.badge_used & mark).zero? }
    mark_set(used, mark) if @test_passage.success? && used.count >= ids.count
  end

  def passed_success_on_first_try?(_no_param)
    @test_passage.success? && @user.test_passages.where(test: @test).count == 1
  end

  def passed_success_all_level?(param)
    return if @test.level.to_s != param

    mark = 0x02
    ids = Test.where(level: param).ids
    used_passages = @user.test_passages.where(test_id: ids).uniq
    used = used_passages.select { |pass| (pass.badge_used & mark).zero? }
    mark_set(used, mark) if @test_passage.success? && used.uniq.count >= ids.count
  end

  def mark_set(array, mark)
    array.each { |pass| pass.badge_used |= mark }
    true
  end
end
