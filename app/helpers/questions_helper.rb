module QuestionsHelper
  TITLES = {new: 'Create New', edit: 'Edit', show: nil}.freeze

  def question_header(question)
    "#{TITLES[action_name.to_sym]} #{question.test.title} Question"
  end
end
