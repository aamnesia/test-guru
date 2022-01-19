class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true

  has_many :questions
  has_many :user_tests
  has_many :users, through: :tests_users

  def self.titles_by_category(category_title)
    joins(:categories)
      .where(categories: { title: category_title })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
