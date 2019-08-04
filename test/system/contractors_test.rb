require "application_system_test_case"

class ContractorsTest < ApplicationSystemTestCase
  setup do
    @contractor = contractors(:one)
  end

  test "visiting the index" do
    visit contractors_url
    assert_selector "h1", text: "Contractors"
  end

  test "creating a Contractor" do
    visit contractors_url
    click_on "New Contractor"

    fill_in "Description", with: @contractor.description
    fill_in "Email", with: @contractor.email
    fill_in "Haid", with: @contractor.haid
    fill_in "Id", with: @contractor.id
    fill_in "Latitude", with: @contractor.latitude
    fill_in "Locality", with: @contractor.locality
    fill_in "Longitude", with: @contractor.longitude
    fill_in "Name", with: @contractor.name
    fill_in "Postal code", with: @contractor.postal_code
    fill_in "Rating", with: @contractor.rating
    fill_in "Region", with: @contractor.region
    fill_in "Review count", with: @contractor.review_count
    fill_in "Street address", with: @contractor.street_address
    fill_in "Telephone", with: @contractor.telephone
    fill_in "User", with: @contractor.user_id
    fill_in "Website", with: @contractor.website
    click_on "Create Contractor"

    assert_text "Contractor was successfully created"
    click_on "Back"
  end

  test "updating a Contractor" do
    visit contractors_url
    click_on "Edit", match: :first

    fill_in "Description", with: @contractor.description
    fill_in "Email", with: @contractor.email
    fill_in "Haid", with: @contractor.haid
    fill_in "Id", with: @contractor.id
    fill_in "Latitude", with: @contractor.latitude
    fill_in "Locality", with: @contractor.locality
    fill_in "Longitude", with: @contractor.longitude
    fill_in "Name", with: @contractor.name
    fill_in "Postal code", with: @contractor.postal_code
    fill_in "Rating", with: @contractor.rating
    fill_in "Region", with: @contractor.region
    fill_in "Review count", with: @contractor.review_count
    fill_in "Street address", with: @contractor.street_address
    fill_in "Telephone", with: @contractor.telephone
    fill_in "User", with: @contractor.user_id
    fill_in "Website", with: @contractor.website
    click_on "Update Contractor"

    assert_text "Contractor was successfully updated"
    click_on "Back"
  end

  test "destroying a Contractor" do
    visit contractors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contractor was successfully destroyed"
  end
end
