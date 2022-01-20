class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id


  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
