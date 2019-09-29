class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def edit; end

  def show; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      # redirect_to test_path(@question.test)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash['alert alert-info'] = 'Question was destroyed'
    redirect_to [:admin, @question.test]
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
