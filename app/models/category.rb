class Category < ApplicationRecord
  has_many :task_profiles

  def self.format_json
    json_arr = [];
    Category.order(:name).includes(:task_profiles).each do |c|
      json_arr << ["key": c.id, "section": true, "label": c.name]
      c.task_profiles.each {|t|
        json_arr << ["key": t.id, "label": t.name]
      }
    end
    return json_arr
  end

end
