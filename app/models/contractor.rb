class Contractor < ApplicationRecord
  belongs_to :user, required: false
end
