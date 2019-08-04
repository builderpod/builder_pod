json.extract! answer, :id, :aid, :answer_display_sequence, :answer_text, :answer_display_text, :active, :default_answer, :presentation_type, :child_questions, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
