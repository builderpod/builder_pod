class AnswerChoice < ApplicationRecord
  belongs_to :answer
  belongs_to :question
  has_one :question_set, through: :question
  belongs_to :task
  has_one :task_profile, through: :task
end
