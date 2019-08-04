class AddCategoryToTaskProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :task_profiles, :category, foreign_key: true
  end
end
