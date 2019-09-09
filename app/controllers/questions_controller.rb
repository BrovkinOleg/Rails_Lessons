class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # http://localhost:3000/tests/:test_id/questions
  def show
    render json: { questions_for_test: Question.where(test_id: params[:test_id]) }
  end

  # http://localhost:3000/tests/:test_id/questions/:question_id
  def show_the_question
    render json: { one_question_for_test: Question.where(test_id: params[:test_id]).find(params[:question_id]) }
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
