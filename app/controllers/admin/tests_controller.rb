class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[edit update show destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def edit; end

  def new
    @test = Test.new
  end

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.create')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.update')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.destroy')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
