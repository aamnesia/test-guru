class BadgeGranterService

  RULES = %i[all_by_category at_first_try all_by_level].freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      badge if send(badge.rule.underscore.to_sym, badge.parameter)
    end
  end

  private

  def all_by_category(category_title)
    return unless @test_passage.test.category.title == category_title

    tests = Test.by_category(category_title).pluck(:id)
    completed = @user.test_passages.passed
                  .where(test: tests)
                  .pluck(:test_id).uniq
    tests.count == completed.count
  end

  def at_first_try(_blank)
    TestPassage.where(test: @test, user: @user).count == 1
  end

  def all_by_level(level)
    return unless @test_passage.test.level == level.to_i

    tests = Test.level(level).pluck(:id)
    completed = @user.test_passages.passed
                  .where(test: tests)
                  .pluck(:test_id).uniq
    tests.count == completed.count
  end

end
