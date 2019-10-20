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
    return if @test_passage.success? == false || @test.category.title != param

    ids = Test.joins(:category).where(categories: { title: param }).ids
    passages = @user.test_passages.where(test_id: ids).uniq
    badge = UsersBadge.joins(:badge).where(badges: { rule_param: param }).last
    unless badge.nil?
      create_date = badge.created_at
      passages = passages.select { |pass| pass.created_at > create_date }
    end
    passages.count >= ids.count
  end

  def passed_success_all_level?(param)
    return if @test_passage.success? == false || @test.level.to_s != param

    ids = Test.where(level: param).ids
    passages = @user.test_passages.where(test_id: ids).uniq
    badge = UsersBadge.joins(:badge).where(badges: { rule_param: param }).last
    unless badge.nil?
      create_date = badge.created_at
      passages = passages.select { |pass| pass.created_at > create_date }
    end
    passages.count >= ids.count
  end

  def passed_success_on_first_try?(_no_param)
    return unless @test_passage.success?

    @user.test_passages.where(test: @test).count == 1
  end
end
