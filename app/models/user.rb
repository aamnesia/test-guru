class User < ApplicationRecord
  def tests_by_level(test_level)
    Test
    .joins('JOIN user_tests ON tests.id = user_tests.test_id')
    .where(user_tests: {user_id: self.id}, level: test_level)
  end
end
