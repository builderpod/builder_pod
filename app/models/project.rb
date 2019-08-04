class Project < ApplicationRecord
  has_many :tasks, inverse_of: :project
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, unless: ->(obj){ obj.longitude.present? }

  def address
    [street_address, locality, region, postal_code].compact.join(', ')
  end

  def zillow_summary
    set_zillow_data
    "#{@zillow_data.finished_square_feet} sq/ft #{@zillow_data.use_code}"
  end



  def zillow_data
    Rubillow::PropertyDetails.deep_search_results({ :address => street_address, :citystatezip => [locality, region, postal_code].compact.join(', ') })
  end

  def property_details
    set_zillow_data
    Rubillow::PropertyDetails.updated_property_details({ :zpid => @zillow_data.zpid })
  end

  def set_zillow_data
    @zillow_data = zillow_data
  end


end
