class TestPassage < ApplicationRecord

  CORRECT_ANSWERS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  # before_validation :before_validation_set_first_question, on: :create
  # before_update :before_update_set_next_question
  before_validation :set_current_question

  def result
    (correct_questions.to_f * 100) / questions_number
  end

  def success?
    result >= CORRECT_ANSWERS_PERCENT
  end

  def completed?
    self.current_question.nil?
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def questions_number
    test.questions.count
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
      correct_answers_count == answer_ids.count - 1
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil?
      self.current_question = test.questions.first
    else
      test.questions.order(:id).where('id > ?', self.current_question.id).first
    end
  end

  # def before_validation_set_first_question
  #   self.current_question = test.questions.first if test.present?
  # end
  #
  # def before_update_set_next_question
  #   self.current_question = next_question
  # end

  def set_current_question
    self.current_question = next_question
  end
end
