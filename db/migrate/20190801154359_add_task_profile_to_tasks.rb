class AddTaskProfileToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :task_profile, foreign_key: true
  end
end
