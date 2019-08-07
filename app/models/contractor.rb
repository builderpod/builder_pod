class Contractor < ApplicationRecord
  belongs_to :user, required: false
  has_many :bids
  accepts_nested_attributes_for :bids, reject_if: :all_blank, allow_destroy: true
  has_many :contractor_categories
  has_many :categories, through: :contractor_categories
  accepts_nested_attributes_for :contractor_categories, reject_if: :all_blank, allow_destroy: true
  has_many :contractor_task_profiles
  has_many :task_profiles, through: :contractor_task_profiles
  accepts_nested_attributes_for :contractor_task_profiles, reject_if: :all_blank, allow_destroy: true
  has_many :contractor_tasks
  has_many :tasks, through: :contractor_tasks

  geocoded_by :address
  has_one_attached :avatar
  after_validation :geocode, unless: ->(obj) { obj.longitude.present? }

  searchkick locations: [:location]

  def address
    [street_address, locality, region, postal_code].compact.join(', ')
  end

  def eligible_tasks
    Task.joins(:category).where(category_id: categories.pluck(:id)).near(address)
  end

  def search_data
    attributes.merge location: {lat: latitude, lon: longitude}
  end

end
