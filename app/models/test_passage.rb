class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def current_question_number
    questions_number - next_questions.count
  end

  def questions_number
    test.questions.count
  end

  def accept!(answer_ids)
    self.correct_questions += 1 unless correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  private

  def correct_answer?(answer_ids)
    # correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  # def before_validation_set_current_question
  #   self.current_question = next_question
  # end

  def next_question
    next_questions.first
  end

  def next_questions
    # current_question = test.questions.first if current_question.nil?
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
