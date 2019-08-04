require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @answer = answers(:one)
  end

  test "visiting the index" do
    visit answers_url
    assert_selector "h1", text: "Answers"
  end

  test "creating a Answer" do
    visit answers_url
    click_on "New Answer"

    check "Active" if @answer.active
    fill_in "Aid", with: @answer.aid
    fill_in "Answer display sequence", with: @answer.answer_display_sequence
    fill_in "Answer display text", with: @answer.answer_display_text
    fill_in "Answer text", with: @answer.answer_text
    fill_in "Child questions", with: @answer.child_questions
    check "Default answer" if @answer.default_answer
    fill_in "Presentation type", with: @answer.presentation_type
    fill_in "Question", with: @answer.question_id
    click_on "Create Answer"

    assert_text "Answer was successfully created"
    click_on "Back"
  end

  test "updating a Answer" do
    visit answers_url
    click_on "Edit", match: :first

    check "Active" if @answer.active
    fill_in "Aid", with: @answer.aid
    fill_in "Answer display sequence", with: @answer.answer_display_sequence
    fill_in "Answer display text", with: @answer.answer_display_text
    fill_in "Answer text", with: @answer.answer_text
    fill_in "Child questions", with: @answer.child_questions
    check "Default answer" if @answer.default_answer
    fill_in "Presentation type", with: @answer.presentation_type
    fill_in "Question", with: @answer.question_id
    click_on "Update Answer"

    assert_text "Answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Answer" do
    visit answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer was successfully destroyed"
  end
end
