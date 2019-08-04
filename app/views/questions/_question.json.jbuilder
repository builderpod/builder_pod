json.extract! question, :id, :oid, :question_id, :question_display_text, :display_to_sp, :question_display_sequence, :page_number, :question_text, :short_question_text, :parent_question_id, :parent_answer_id, :parent_question_text, :required, :glossary_term, :default_answer, :active, :attribute_match, :question_set_id, :created_at, :updated_at
json.url question_url(question, format: :json)
