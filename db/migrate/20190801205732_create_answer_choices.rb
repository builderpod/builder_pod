class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.references :answer, foreign_key: true
      t.references :question, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
