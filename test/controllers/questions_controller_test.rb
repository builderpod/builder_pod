require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { active: @question.active, attribute_match: @question.attribute_match, default_answer: @question.default_answer, display_to_sp: @question.display_to_sp, glossary_term: @question.glossary_term, oid: @question.oid, page_number: @question.page_number, parent_answer_id: @question.parent_answer_id, parent_question_id: @question.parent_question_id, parent_question_text: @question.parent_question_text, question_display_sequence: @question.question_display_sequence, question_display_text: @question.question_display_text, question_id: @question.question_id, question_set_id: @question.question_set_id, question_text: @question.question_text, required: @question.required, short_question_text: @question.short_question_text } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { active: @question.active, attribute_match: @question.attribute_match, default_answer: @question.default_answer, display_to_sp: @question.display_to_sp, glossary_term: @question.glossary_term, oid: @question.oid, page_number: @question.page_number, parent_answer_id: @question.parent_answer_id, parent_question_id: @question.parent_question_id, parent_question_text: @question.parent_question_text, question_display_sequence: @question.question_display_sequence, question_display_text: @question.question_display_text, question_id: @question.question_id, question_set_id: @question.question_set_id, question_text: @question.question_text, required: @question.required, short_question_text: @question.short_question_text } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
