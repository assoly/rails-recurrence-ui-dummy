require "application_system_test_case"

class WebinarsTest < ApplicationSystemTestCase
  setup do
    @webinar = webinars(:one)
  end

  test "visiting the index" do
    visit webinars_url
    assert_selector "h1", text: "Webinars"
  end

  test "should create webinar" do
    visit webinars_url
    click_on "New webinar"

    fill_in "Description", with: @webinar.description
    fill_in "Finishes at", with: @webinar.finishes_at
    fill_in "Schedule json", with: @webinar.schedule_json
    fill_in "Starts at", with: @webinar.starts_at
    fill_in "Time zone name", with: @webinar.time_zone_name
    fill_in "Title", with: @webinar.title
    click_on "Create Webinar"

    assert_text "Webinar was successfully created"
    click_on "Back"
  end

  test "should update Webinar" do
    visit webinar_url(@webinar)
    click_on "Edit this webinar", match: :first

    fill_in "Description", with: @webinar.description
    fill_in "Finishes at", with: @webinar.finishes_at
    fill_in "Schedule json", with: @webinar.schedule_json
    fill_in "Starts at", with: @webinar.starts_at
    fill_in "Time zone name", with: @webinar.time_zone_name
    fill_in "Title", with: @webinar.title
    click_on "Update Webinar"

    assert_text "Webinar was successfully updated"
    click_on "Back"
  end

  test "should destroy Webinar" do
    visit webinar_url(@webinar)
    accept_confirm { click_on "Destroy this webinar", match: :first }

    assert_text "Webinar was successfully destroyed"
  end
end
