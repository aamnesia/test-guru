class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: 'Question was created'
    else
      render plain: 'An error occuried'
    end
  end

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.body
  end

  def destroy
    @question.destroy
    render plain: 'Question was removed'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found', status: 404
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
