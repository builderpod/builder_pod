class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :aid
      t.integer :answer_display_sequence
      t.text :answer_text
      t.text :answer_display_text
      t.boolean :active
      t.boolean :default_answer
      t.text :presentation_type
      t.text :child_questions
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
