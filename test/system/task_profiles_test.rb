require "application_system_test_case"

class TaskProfilesTest < ApplicationSystemTestCase
  setup do
    @task_profile = task_profiles(:one)
  end

  test "visiting the index" do
    visit task_profiles_url
    assert_selector "h1", text: "Task Profiles"
  end

  test "creating a Task profile" do
    visit task_profiles_url
    click_on "New Task Profile"

    fill_in "Accept goal", with: @task_profile.accept_goal
    fill_in "Bridge active", with: @task_profile.bridge_active
    fill_in "Bridge link", with: @task_profile.bridge_link_id
    fill_in "Bridge link text", with: @task_profile.bridge_link_text
    fill_in "Bridge oid", with: @task_profile.bridge_oid
    fill_in "Bridge text", with: @task_profile.bridge_text
    check "Commercial" if @task_profile.commercial
    fill_in "Consideration", with: @task_profile.consideration_id
    fill_in "Content description", with: @task_profile.content_description
    fill_in "Default cost guide", with: @task_profile.default_cost_guide_id
    fill_in "Description", with: @task_profile.description
    fill_in "Emc category oid", with: @task_profile.emc_category_oid
    fill_in "Es score", with: @task_profile.es_score
    fill_in "Html title", with: @task_profile.html_title
    fill_in "Keywords", with: @task_profile.keywords
    check "Location specific" if @task_profile.location_specific
    check "Matchable" if @task_profile.matchable
    fill_in "Meta description", with: @task_profile.meta_description
    check "Multi zip" if @task_profile.multi_zip
    fill_in "Name", with: @task_profile.name
    fill_in "Oid", with: @task_profile.oid
    fill_in "Pre match type", with: @task_profile.pre_match_type_id
    fill_in "Primary question set", with: @task_profile.primary_question_set_id
    check "Profileable" if @task_profile.profileable
    fill_in "Pwc", with: @task_profile.pwc_id
    fill_in "Redirect to oid", with: @task_profile.redirect_to_oid
    fill_in "Rollover long desc", with: @task_profile.rollover_long_desc
    fill_in "Rollover short desc", with: @task_profile.rollover_short_desc
    fill_in "Search keywords", with: @task_profile.search_keywords
    fill_in "Sector", with: @task_profile.sector_id
    fill_in "Sp display name", with: @task_profile.sp_display_name
    fill_in "Text messaging name", with: @task_profile.text_messaging_name
    fill_in "Url name", with: @task_profile.url_name
    check "View first parent task" if @task_profile.view_first_parent_task
    fill_in "Xm descriptor", with: @task_profile.xm_descriptor
    fill_in "Xm header descriptor", with: @task_profile.xm_header_descriptor
    fill_in "Xm name", with: @task_profile.xm_name
    click_on "Create Task profile"

    assert_text "Task profile was successfully created"
    click_on "Back"
  end

  test "updating a Task profile" do
    visit task_profiles_url
    click_on "Edit", match: :first

    fill_in "Accept goal", with: @task_profile.accept_goal
    fill_in "Bridge active", with: @task_profile.bridge_active
    fill_in "Bridge link", with: @task_profile.bridge_link_id
    fill_in "Bridge link text", with: @task_profile.bridge_link_text
    fill_in "Bridge oid", with: @task_profile.bridge_oid
    fill_in "Bridge text", with: @task_profile.bridge_text
    check "Commercial" if @task_profile.commercial
    fill_in "Consideration", with: @task_profile.consideration_id
    fill_in "Content description", with: @task_profile.content_description
    fill_in "Default cost guide", with: @task_profile.default_cost_guide_id
    fill_in "Description", with: @task_profile.description
    fill_in "Emc category oid", with: @task_profile.emc_category_oid
    fill_in "Es score", with: @task_profile.es_score
    fill_in "Html title", with: @task_profile.html_title
    fill_in "Keywords", with: @task_profile.keywords
    check "Location specific" if @task_profile.location_specific
    check "Matchable" if @task_profile.matchable
    fill_in "Meta description", with: @task_profile.meta_description
    check "Multi zip" if @task_profile.multi_zip
    fill_in "Name", with: @task_profile.name
    fill_in "Oid", with: @task_profile.oid
    fill_in "Pre match type", with: @task_profile.pre_match_type_id
    fill_in "Primary question set", with: @task_profile.primary_question_set_id
    check "Profileable" if @task_profile.profileable
    fill_in "Pwc", with: @task_profile.pwc_id
    fill_in "Redirect to oid", with: @task_profile.redirect_to_oid
    fill_in "Rollover long desc", with: @task_profile.rollover_long_desc
    fill_in "Rollover short desc", with: @task_profile.rollover_short_desc
    fill_in "Search keywords", with: @task_profile.search_keywords
    fill_in "Sector", with: @task_profile.sector_id
    fill_in "Sp display name", with: @task_profile.sp_display_name
    fill_in "Text messaging name", with: @task_profile.text_messaging_name
    fill_in "Url name", with: @task_profile.url_name
    check "View first parent task" if @task_profile.view_first_parent_task
    fill_in "Xm descriptor", with: @task_profile.xm_descriptor
    fill_in "Xm header descriptor", with: @task_profile.xm_header_descriptor
    fill_in "Xm name", with: @task_profile.xm_name
    click_on "Update Task profile"

    assert_text "Task profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Task profile" do
    visit task_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task profile was successfully destroyed"
  end
end
