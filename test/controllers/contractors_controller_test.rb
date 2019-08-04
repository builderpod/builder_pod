require 'test_helper'

class ContractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contractor = contractors(:one)
  end

  test "should get index" do
    get contractors_url
    assert_response :success
  end

  test "should get new" do
    get new_contractor_url
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post contractors_url, params: { contractor: { description: @contractor.description, email: @contractor.email, haid: @contractor.haid, id: @contractor.id, latitude: @contractor.latitude, locality: @contractor.locality, longitude: @contractor.longitude, name: @contractor.name, postal_code: @contractor.postal_code, rating: @contractor.rating, region: @contractor.region, review_count: @contractor.review_count, street_address: @contractor.street_address, telephone: @contractor.telephone, user_id: @contractor.user_id, website: @contractor.website } }
    end

    assert_redirected_to contractor_url(Contractor.last)
  end

  test "should show contractor" do
    get contractor_url(@contractor)
    assert_response :success
  end

  test "should get edit" do
    get edit_contractor_url(@contractor)
    assert_response :success
  end

  test "should update contractor" do
    patch contractor_url(@contractor), params: { contractor: { description: @contractor.description, email: @contractor.email, haid: @contractor.haid, id: @contractor.id, latitude: @contractor.latitude, locality: @contractor.locality, longitude: @contractor.longitude, name: @contractor.name, postal_code: @contractor.postal_code, rating: @contractor.rating, region: @contractor.region, review_count: @contractor.review_count, street_address: @contractor.street_address, telephone: @contractor.telephone, user_id: @contractor.user_id, website: @contractor.website } }
    assert_redirected_to contractor_url(@contractor)
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete contractor_url(@contractor)
    end

    assert_redirected_to contractors_url
  end
end
