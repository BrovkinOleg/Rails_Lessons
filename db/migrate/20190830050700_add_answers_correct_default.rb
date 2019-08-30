# frozen_string_literal: true

# add answers.correct default false
class AddAnswersCorrectDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, from: nil, to: unquoted_false)
  end
end
