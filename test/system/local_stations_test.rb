require "application_system_test_case"

class LocalStationsTest < ApplicationSystemTestCase
  setup do
    @local_station = local_stations(:one)
  end

  test "visiting the index" do
    visit local_stations_url
    assert_selector "h1", text: "Local Stations"
  end

  test "creating a Local station" do
    visit local_stations_url
    click_on "New Local Station"

    fill_in "Distance", with: @local_station.distance
    fill_in "Line", with: @local_station.line
    fill_in "Station", with: @local_station.station
    click_on "Create Local station"

    assert_text "Local station was successfully created"
    click_on "Back"
  end

  test "updating a Local station" do
    visit local_stations_url
    click_on "Edit", match: :first

    fill_in "Distance", with: @local_station.distance
    fill_in "Line", with: @local_station.line
    fill_in "Station", with: @local_station.station
    click_on "Update Local station"

    assert_text "Local station was successfully updated"
    click_on "Back"
  end

  test "destroying a Local station" do
    visit local_stations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Local station was successfully destroyed"
  end
end
