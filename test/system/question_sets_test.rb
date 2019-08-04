require "application_system_test_case"

class QuestionSetsTest < ApplicationSystemTestCase
  setup do
    @question_set = question_sets(:one)
  end

  test "visiting the index" do
    visit question_sets_url
    assert_selector "h1", text: "Question Sets"
  end

  test "creating a Question set" do
    visit question_sets_url
    click_on "New Question Set"

    fill_in "Interview type", with: @question_set.interview_type
    fill_in "Oid", with: @question_set.oid
    fill_in "Original task oid", with: @question_set.original_task_oid
    fill_in "Set", with: @question_set.set_id
    fill_in "Task", with: @question_set.task_id
    fill_in "Task oid", with: @question_set.task_oid
    click_on "Create Question set"

    assert_text "Question set was successfully created"
    click_on "Back"
  end

  test "updating a Question set" do
    visit question_sets_url
    click_on "Edit", match: :first

    fill_in "Interview type", with: @question_set.interview_type
    fill_in "Oid", with: @question_set.oid
    fill_in "Original task oid", with: @question_set.original_task_oid
    fill_in "Set", with: @question_set.set_id
    fill_in "Task", with: @question_set.task_id
    fill_in "Task oid", with: @question_set.task_oid
    click_on "Update Question set"

    assert_text "Question set was successfully updated"
    click_on "Back"
  end

  test "destroying a Question set" do
    visit question_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question set was successfully destroyed"
  end
end
