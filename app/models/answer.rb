class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_number_of_answers
    errors.add(:amount) if question.answers.count >= 4
  end
end
