class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task_profile
  has_one :category, through: :task_profile
  searchkick locations: [:location]
  before_save :inherit_location
  geocoded_by :address

  def user
    project.user
  end

  def address
    project.address
  end
  
  def name
    task_profile.name
  end

  def inherit_location
    self.longitude = project.longitude
    self.latitude = project.latitude
  end

  def search_data
    attributes.merge location: {lat: latitude, lon: longitude}
  end

end
