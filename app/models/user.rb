class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  def success_tests
    tests.where(test_passages: { success: true })
  end

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

  def rewarded?(badge)
    UserBadge.where(user: self, badge: badge).present?
  end

end
