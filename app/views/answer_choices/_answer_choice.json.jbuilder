json.extract! answer_choice, :id, :answer_id, :question_id, :task_id, :created_at, :updated_at
json.url answer_choice_url(answer_choice, format: :json)
