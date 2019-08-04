class ContractorSerializer < ActiveModel::Serializer
  attributes :id, :id, :haid, :name, :website, :description, :rating, :review_count, :telephone, :street_address, :locality, :region, :postal_code, :longitude, :latitude, :email
  has_one :user
end
