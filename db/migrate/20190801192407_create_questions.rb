class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :oid
      t.integer :question_id
      t.text :question_display_text
      t.boolean :display_to_sp
      t.integer :question_display_sequence
      t.integer :page_number
      t.text :question_text
      t.text :short_question_text
      t.integer :parent_question_id
      t.integer :parent_answer_id
      t.text :parent_question_text
      t.boolean :required
      t.boolean :glossary_term
      t.integer :default_answer
      t.boolean :active
      t.boolean :attribute_match
      t.references :question_set, foreign_key: true

      t.timestamps
    end
  end
end
