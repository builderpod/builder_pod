require "application_system_test_case"

class AnswerChoicesTest < ApplicationSystemTestCase
  setup do
    @answer_choice = answer_choices(:one)
  end

  test "visiting the index" do
    visit answer_choices_url
    assert_selector "h1", text: "Answer Choices"
  end

  test "creating a Answer choice" do
    visit answer_choices_url
    click_on "New Answer Choice"

    fill_in "Answer", with: @answer_choice.answer_id
    fill_in "Question", with: @answer_choice.question_id
    fill_in "Task", with: @answer_choice.task_id
    click_on "Create Answer choice"

    assert_text "Answer choice was successfully created"
    click_on "Back"
  end

  test "updating a Answer choice" do
    visit answer_choices_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @answer_choice.answer_id
    fill_in "Question", with: @answer_choice.question_id
    fill_in "Task", with: @answer_choice.task_id
    click_on "Update Answer choice"

    assert_text "Answer choice was successfully updated"
    click_on "Back"
  end

  test "destroying a Answer choice" do
    visit answer_choices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer choice was successfully destroyed"
  end
end
