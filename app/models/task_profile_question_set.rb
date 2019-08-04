class TaskProfileQuestionSet < ApplicationRecord
  belongs_to :task_profile
  belongs_to :question_set
end
