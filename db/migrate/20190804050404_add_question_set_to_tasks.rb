class AddQuestionSetToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_sets, :task_profile, foreign_key: true
  end
end
