class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[edit update show destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def edit; end

  def new
    @test = Test.new
  end

  def index; end

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

  def update_inline
   if @test.update(test_params)
     redirect_to admin_tests_path
   else
     render :index
   end
 end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.destroy')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :ready, :timer)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

end
