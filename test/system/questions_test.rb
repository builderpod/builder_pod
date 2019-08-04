require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question = questions(:one)
  end

  test "visiting the index" do
    visit questions_url
    assert_selector "h1", text: "Questions"
  end

  test "creating a Question" do
    visit questions_url
    click_on "New Question"

    check "Active" if @question.active
    check "Attribute match" if @question.attribute_match
    fill_in "Default answer", with: @question.default_answer
    check "Display to sp" if @question.display_to_sp
    check "Glossary term" if @question.glossary_term
    fill_in "Oid", with: @question.oid
    fill_in "Page number", with: @question.page_number
    fill_in "Parent answer", with: @question.parent_answer_id
    fill_in "Parent question", with: @question.parent_question_id
    fill_in "Parent question text", with: @question.parent_question_text
    fill_in "Question display sequence", with: @question.question_display_sequence
    fill_in "Question display text", with: @question.question_display_text
    fill_in "Question", with: @question.question_id
    fill_in "Question set", with: @question.question_set_id
    fill_in "Question text", with: @question.question_text
    check "Required" if @question.required
    fill_in "Short question text", with: @question.short_question_text
    click_on "Create Question"

    assert_text "Question was successfully created"
    click_on "Back"
  end

  test "updating a Question" do
    visit questions_url
    click_on "Edit", match: :first

    check "Active" if @question.active
    check "Attribute match" if @question.attribute_match
    fill_in "Default answer", with: @question.default_answer
    check "Display to sp" if @question.display_to_sp
    check "Glossary term" if @question.glossary_term
    fill_in "Oid", with: @question.oid
    fill_in "Page number", with: @question.page_number
    fill_in "Parent answer", with: @question.parent_answer_id
    fill_in "Parent question", with: @question.parent_question_id
    fill_in "Parent question text", with: @question.parent_question_text
    fill_in "Question display sequence", with: @question.question_display_sequence
    fill_in "Question display text", with: @question.question_display_text
    fill_in "Question", with: @question.question_id
    fill_in "Question set", with: @question.question_set_id
    fill_in "Question text", with: @question.question_text
    check "Required" if @question.required
    fill_in "Short question text", with: @question.short_question_text
    click_on "Update Question"

    assert_text "Question was successfully updated"
    click_on "Back"
  end

  test "destroying a Question" do
    visit questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question was successfully destroyed"
  end
end
