class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists

  validates :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  def tests_by_level(test_level)
    tests.level(test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def name
    self.first_name || 'Anonymus'
  end
end
