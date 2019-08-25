class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :project_id, :created_at, :updated_at, :task_profile, :responses

  # def task_profile
  #   ActiveModel::SerializableResource.new(object.tasks, each_serializer: TaskSerializer)
  # end

end
