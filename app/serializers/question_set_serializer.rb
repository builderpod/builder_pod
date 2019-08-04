class QuestionSetSerializer < ActiveModel::Serializer
  attributes :id, :questions
  def questions
    ActiveModel::SerializableResource.new(object.questions.order(:question_display_sequence),  each_serializer: QuestionSerializer)
  end
end