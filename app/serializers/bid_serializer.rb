class BidSerializer < ActiveModel::Serializer
  attributes :id, :amount, :start, :end
  has_one :task
  has_one :contractor
end
