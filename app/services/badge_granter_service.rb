class BadgeGranterService

  RULES = %i[all_by_category at_first_try all_by_level].freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def call
    Badge.all.select do |badge|
      badge if send(badge.rule.underscore.to_sym, badge.parameter)
    end
  end

  private

  def all_by_category(category_title)
    return unless @test_passage.test.category.title == category_title
    return unless @test_passage.success?
    (
      Test.by_category(category_title).pluck(:id) -
      new_passages(last_badge_date_by_rules(__method__, category_title)).ids
    ).empty?
  end

  def at_first_try(_blank)
    return unless @test_passage.success?
    @user.tests.where(id: @test_passage.test.id, test_passages: { success: true}).count == 1
  end

  def all_by_level(level)
    return unless @test_passage.test.level == level.to_i
    return unless @test_passage.success?

    (
      Test.level(level).pluck(:id) -
      new_passages(last_badge_date_by_rules(__method__, level)).ids
    ).empty?
  end

  private

  def last_badge_date_by_rules(rule, parameter)
    @user.user_badges.by_rules(rule, parameter).order(:created_at).last.try(:created_at)
  end

  def new_passages(last_date)
    return @user.success_tests if last_date.nil?
    @user.success_tests.where('test_passages.created_at > ?', last_date)
  end
end
