class AddQuestionSetToTaskProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :task_profiles, :question_set, foreign_key: true
  end
end
