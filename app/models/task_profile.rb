class TaskProfile < ApplicationRecord
  has_many :tasks
  belongs_to :category

  searchkick

  def question_set
    file = Rails.root.join('app', 'models', 'json', "#{oid}.json")
    JSON.parse(File.read(file))["__cache./api/resource/task/interview/#{oid}/"]["questions"]
  end


end

