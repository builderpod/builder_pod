class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task_profile
  has_many :answer_choices
  has_many :answers, through: :answer_choices
  has_many :questions, through: :answer_choices
  has_one :question_set, through: :task_profile
  accepts_nested_attributes_for :answer_choices, reject_if: :all_blank, allow_destroy: true
 
  def task_profile_name
    task_profile.try(:name)
  end

  def task_profile_name=(name)
    self.task_profile = TaskProfile.find_by_name(name) if name.present?
  end

  def name 
  	task_profile.name 
  end
end
