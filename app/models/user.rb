class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_by_level(test_level)
    Test.where(level: test_level)
  end
end
