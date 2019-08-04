class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_display_text, :answers
  def answers
    ActiveModel::SerializableResource.new(object.answers.order(:answer_display_sequence),  each_serializer: AnswerSerializer)
  end
end