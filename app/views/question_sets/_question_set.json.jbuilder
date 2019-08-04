json.extract! question_set, :id, :oid, :task_id, :task_oid, :original_task_oid, :set_id, :interview_type, :created_at, :updated_at
json.url question_set_url(question_set, format: :json)
