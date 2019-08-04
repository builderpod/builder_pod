class CreateTaskProfileQuestionSets < ActiveRecord::Migration[5.2]
  def change
    create_table :task_profile_question_sets do |t|
      t.references :task_profile, foreign_key: true
      t.references :question_set, foreign_key: true

      t.timestamps
    end
  end
end
