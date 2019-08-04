class TaskProfile < ApplicationRecord
	has_many :tasks
	belongs_to :question_set
	has_many :task_profile_question_sets
	has_many :question_sets, through: :task_profile_question_sets
	belongs_to :category

	searchkick


end

