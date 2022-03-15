class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      reward_user if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call
    url = result.html_url

    flash_options = if service.success?
      current_user.gists.create(question: question, url: url)
      { notice: t('.success', url: url)}
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def reward_user
    @rewarded_badges = BadgeGranterService.new(@test_passage).call
    current_user.badges << @rewarded_badges
    flash[:notice] = "You gained new badge!" if @rewarded_badges
  end

end
