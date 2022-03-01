class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question, on: [:create, :update]


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_index
    test.questions.index(current_question)
  end

  def number_of_questions
    test.questions.count
  end

  def success_percents
    self.correct_questions * 100 / test.questions.count
  end

  def success?
    success_percents.to_i >= SUCCESS_RATIO
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count if correct_answers

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_current_question
    if new_record? && test.present?
      self.current_question = test.questions.order(:id).first
    else
      self.current_question = test.questions.order(:id)[current_question_index + 1]
    end
  end

end
