class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    gist_site = result.gist_url
    gist_hash = result.hash
    if result.success?
      create_gist!(gist_site)
      flash_options = { notice: t('.success', link: "<a href=#{gist_site} target='_blank'>#{gist_hash}</a>") }
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def create_gist!(url)
    current_user.gists.create!(question: @test_passage.current_question, url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
