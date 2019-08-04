class TaskProfile < ApplicationRecord
	has_many :tasks
	belongs_to :question_set
	belongs_to :category

	searchkick


end

