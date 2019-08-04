class CreateQuestionSets < ActiveRecord::Migration[5.2]
  def change
    create_table :question_sets do |t|
      t.integer :oid
      t.integer :task_id
      t.integer :task_oid
      t.integer :original_task_oid
      t.integer :set_id
      t.string :interview_type

      t.timestamps
    end
  end
end
