class ProjectSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :created_at, :updated_at,
             :user_id, :locality, :region, :postal_code,
             :longitude, :latitude, :street_address, :avatar, :tasks,
             :documents, :user

  def tasks
    ActiveModel::SerializableResource.new(object.tasks, each_serializer: TaskSerializer)
  end

  def documents
    ActiveModel::SerializableResource.new(object.documents, each_serializer: DocumentSerializer)
  end

  def avatar
    # variant = object.avatar.variant(resize: "100x100")
    return rails_blob_url(object.avatar, only_path: true)
  end

end
