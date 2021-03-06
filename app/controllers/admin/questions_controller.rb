class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def edit; end

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question), notice: "Question was successfully created!"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: "Question was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    @question.test.change_not_valid
    redirect_to admin_test_path(@question.test), notice: "Question was successfully deleted!"
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
