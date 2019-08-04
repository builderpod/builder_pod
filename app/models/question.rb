class Question < ApplicationRecord
  belongs_to :question_set
  has_many :answers, dependent: :destroy 
end
