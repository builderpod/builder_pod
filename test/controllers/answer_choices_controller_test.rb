require 'test_helper'

class AnswerChoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_choice = answer_choices(:one)
  end

  test "should get index" do
    get answer_choices_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_choice_url
    assert_response :success
  end

  test "should create answer_choice" do
    assert_difference('AnswerChoice.count') do
      post answer_choices_url, params: { answer_choice: { answer_id: @answer_choice.answer_id, question_id: @answer_choice.question_id, task_id: @answer_choice.task_id } }
    end

    assert_redirected_to answer_choice_url(AnswerChoice.last)
  end

  test "should show answer_choice" do
    get answer_choice_url(@answer_choice)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_choice_url(@answer_choice)
    assert_response :success
  end

  test "should update answer_choice" do
    patch answer_choice_url(@answer_choice), params: { answer_choice: { answer_id: @answer_choice.answer_id, question_id: @answer_choice.question_id, task_id: @answer_choice.task_id } }
    assert_redirected_to answer_choice_url(@answer_choice)
  end

  test "should destroy answer_choice" do
    assert_difference('AnswerChoice.count', -1) do
      delete answer_choice_url(@answer_choice)
    end

    assert_redirected_to answer_choices_url
  end
end
