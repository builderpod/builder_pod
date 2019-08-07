class Bid < ApplicationRecord
  belongs_to :task
  belongs_to :contractor
  has_one :project, through: :task
end
