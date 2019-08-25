class Project < ApplicationRecord
  has_many :tasks, inverse_of: :project
  has_many :bids, through: :tasks
  has_many :documents, as: :documentable, dependent: :destroy

  belongs_to :user
  validates :street_address, presence: true
  validates :postal_code, presence: true
  geocoded_by :address
  has_one_attached :avatar
  # after_validation :geocode, unless: ->(obj) { obj.longitude.present? }

  # searchkick locations: [:location]

  def address
    [street_address, locality, region, postal_code].compact.join(', ')
  end

  def zillow_summary
    set_zillow_data
    "#{@zillow_data.finished_square_feet} sq/ft #{@zillow_data.use_code}"
  end


  def zillow_data
    Rubillow::PropertyDetails.deep_search_results({:address => street_address, :citystatezip => [locality, region, postal_code].compact.join(', ')})
  end

  def property_details
    set_zillow_data
    Rubillow::PropertyDetails.updated_property_details({:zpid => @zillow_data.zpid})
  end

  def set_zillow_data
    @zillow_data = zillow_data
  end


  def search_data
    attributes.merge location: {lat: latitude, lon: longitude}
  end

end
