class QuestionSet < ApplicationRecord
	has_many :questions, dependent: :destroy 
	has_many :answers, through: :questions
	has_one :task_profile
	has_many :task_profile_question_sets
	has_many :task_profiles, through: :task_profile_question_sets
end
