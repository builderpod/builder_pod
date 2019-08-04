class QuestionSet < ApplicationRecord
	has_many :questions, dependent: :destroy 
	has_many :answers, through: :questions
	has_one :task_profile
end
