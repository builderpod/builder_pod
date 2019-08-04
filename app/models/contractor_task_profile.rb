class ContractorTaskProfile < ApplicationRecord
  belongs_to :contractor
  belongs_to :task_profile
end
