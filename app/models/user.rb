require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  has_secure_password

  def tests_by_level(test_level)
    tests.level(test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
