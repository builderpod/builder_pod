class DocumentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :documentable_type, :documentable_id, :created_at

  def document
    return rails_blob_url(object.doc, only_path: true)
  end

end