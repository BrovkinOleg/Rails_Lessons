class QuestionsController < ApplicationController

  # http://localhost:3000/tests/:test_id/questions
  def show
    render json: { questions_for_test: Question.where(test_id: params[:test_id]) }
  end

  # http://localhost:3000/tests/:test_id/questions/:question_id
  def show_the_question
    render json: { one_question_for_test: Question.where(test_id: params[:test_id]).find(params[:question_id]) }
  end

  # def create
  #
  # end
end
