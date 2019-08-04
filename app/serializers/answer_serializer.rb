class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer_display_text, :answer_display_sequence, :presentation_type
end