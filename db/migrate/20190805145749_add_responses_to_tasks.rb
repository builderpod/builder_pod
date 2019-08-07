class AddResponsesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :responses, :jsonb, null: false, default: '{}'
    add_index  :tasks, :responses, using: :gin
    
    remove_reference :task_profiles, :question_set
    remove_reference :question_sets, :task_profile
    drop_table :task_profile_question_sets  
    drop_table :answer_choices
    drop_table :answers
    drop_table :questions 
    drop_table :question_sets
  end
end
