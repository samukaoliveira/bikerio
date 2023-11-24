require "application_system_test_case"

class ApisTest < ApplicationSystemTestCase
  setup do
    @api = apis(:one)
  end

  test "visiting the index" do
    visit apis_url
    assert_selector "h1", text: "Apis"
  end

  test "should create api" do
    visit apis_url
    click_on "New api"

    fill_in "Endereco", with: @api.endereco
    fill_in "Latitude", with: @api.latitude
    fill_in "Longitude", with: @api.longitude
    click_on "Create Api"

    assert_text "Api was successfully created"
    click_on "Back"
  end

  test "should update Api" do
    visit api_url(@api)
    click_on "Edit this api", match: :first

    fill_in "Endereco", with: @api.endereco
    fill_in "Latitude", with: @api.latitude
    fill_in "Longitude", with: @api.longitude
    click_on "Update Api"

    assert_text "Api was successfully updated"
    click_on "Back"
  end

  test "should destroy Api" do
    visit api_url(@api)
    click_on "Destroy this api", match: :first

    assert_text "Api was successfully destroyed"
  end
end
