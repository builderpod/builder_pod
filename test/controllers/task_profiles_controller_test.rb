require 'test_helper'

class TaskProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_profile = task_profiles(:one)
  end

  test "should get index" do
    get task_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_task_profile_url
    assert_response :success
  end

  test "should create task_profile" do
    assert_difference('TaskProfile.count') do
      post task_profiles_url, params: { task_profile: { accept_goal: @task_profile.accept_goal, bridge_active: @task_profile.bridge_active, bridge_link_id: @task_profile.bridge_link_id, bridge_link_text: @task_profile.bridge_link_text, bridge_oid: @task_profile.bridge_oid, bridge_text: @task_profile.bridge_text, commercial: @task_profile.commercial, consideration_id: @task_profile.consideration_id, content_description: @task_profile.content_description, default_cost_guide_id: @task_profile.default_cost_guide_id, description: @task_profile.description, emc_category_oid: @task_profile.emc_category_oid, es_score: @task_profile.es_score, html_title: @task_profile.html_title, keywords: @task_profile.keywords, location_specific: @task_profile.location_specific, matchable: @task_profile.matchable, meta_description: @task_profile.meta_description, multi_zip: @task_profile.multi_zip, name: @task_profile.name, oid: @task_profile.oid, pre_match_type_id: @task_profile.pre_match_type_id, primary_question_set_id: @task_profile.primary_question_set_id, profileable: @task_profile.profileable, pwc_id: @task_profile.pwc_id, redirect_to_oid: @task_profile.redirect_to_oid, rollover_long_desc: @task_profile.rollover_long_desc, rollover_short_desc: @task_profile.rollover_short_desc, search_keywords: @task_profile.search_keywords, sector_id: @task_profile.sector_id, sp_display_name: @task_profile.sp_display_name, text_messaging_name: @task_profile.text_messaging_name, url_name: @task_profile.url_name, view_first_parent_task: @task_profile.view_first_parent_task, xm_descriptor: @task_profile.xm_descriptor, xm_header_descriptor: @task_profile.xm_header_descriptor, xm_name: @task_profile.xm_name } }
    end

    assert_redirected_to task_profile_url(TaskProfile.last)
  end

  test "should show task_profile" do
    get task_profile_url(@task_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_profile_url(@task_profile)
    assert_response :success
  end

  test "should update task_profile" do
    patch task_profile_url(@task_profile), params: { task_profile: { accept_goal: @task_profile.accept_goal, bridge_active: @task_profile.bridge_active, bridge_link_id: @task_profile.bridge_link_id, bridge_link_text: @task_profile.bridge_link_text, bridge_oid: @task_profile.bridge_oid, bridge_text: @task_profile.bridge_text, commercial: @task_profile.commercial, consideration_id: @task_profile.consideration_id, content_description: @task_profile.content_description, default_cost_guide_id: @task_profile.default_cost_guide_id, description: @task_profile.description, emc_category_oid: @task_profile.emc_category_oid, es_score: @task_profile.es_score, html_title: @task_profile.html_title, keywords: @task_profile.keywords, location_specific: @task_profile.location_specific, matchable: @task_profile.matchable, meta_description: @task_profile.meta_description, multi_zip: @task_profile.multi_zip, name: @task_profile.name, oid: @task_profile.oid, pre_match_type_id: @task_profile.pre_match_type_id, primary_question_set_id: @task_profile.primary_question_set_id, profileable: @task_profile.profileable, pwc_id: @task_profile.pwc_id, redirect_to_oid: @task_profile.redirect_to_oid, rollover_long_desc: @task_profile.rollover_long_desc, rollover_short_desc: @task_profile.rollover_short_desc, search_keywords: @task_profile.search_keywords, sector_id: @task_profile.sector_id, sp_display_name: @task_profile.sp_display_name, text_messaging_name: @task_profile.text_messaging_name, url_name: @task_profile.url_name, view_first_parent_task: @task_profile.view_first_parent_task, xm_descriptor: @task_profile.xm_descriptor, xm_header_descriptor: @task_profile.xm_header_descriptor, xm_name: @task_profile.xm_name } }
    assert_redirected_to task_profile_url(@task_profile)
  end

  test "should destroy task_profile" do
    assert_difference('TaskProfile.count', -1) do
      delete task_profile_url(@task_profile)
    end

    assert_redirected_to task_profiles_url
  end
end
