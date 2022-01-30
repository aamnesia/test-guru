module AnswersHelper
  TITLES = {new: 'Create New', edit: 'Edit', show: nil}.freeze

  def answer_header(answer)
    "#{TITLES[action_name.to_sym]} Answer on '#{answer.question.body}' Question"
  end
end
