class ContractorCategory < ApplicationRecord
  belongs_to :contractor
  belongs_to :category
end
