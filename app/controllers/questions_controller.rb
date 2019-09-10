class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy del_question]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def new
    render file: '../views/questions/new.html.erb', layout: false
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  def del_question
    @question.destroy
    redirect_to action: :index
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
