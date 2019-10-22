class TestPassage < ApplicationRecord

  CORRECT_ANSWERS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question
  before_update :before_update_check_time_left

  def passage_result
    (correct_questions.to_f * 100) / questions_number
  end

  def success?
    passage_result >= CORRECT_ANSWERS_PERCENT
  end

  def completed?
    self.current_question.nil?
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
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
#-----------------------------
  def timer_seconds
    (expires_at - Time.current).to_i
  end

  private

  def expires_at
    created_at + test.timeleft.minutes
  end

  def time_is_over?
    expires_at < Time.current
  end

  def before_update_check_time_left
    self.current_question = nil if time_is_over?
  end
#-----------------------------
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

  def set_current_question
    self.current_question = next_question
  end
end
