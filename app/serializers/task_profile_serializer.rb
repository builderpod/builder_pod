class TaskProfileSerializer < ActiveModel::Serializer
  attributes :id, :name
  def question_set
    ActiveModel::SerializableResource.new(object.question_set,  each_serializer: QuestionSetSerializer)
  end
end