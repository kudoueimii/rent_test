require 'test_helper'

class LocalStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @local_station = local_stations(:one)
  end

  test "should get index" do
    get local_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_local_station_url
    assert_response :success
  end

  test "should create local_station" do
    assert_difference('LocalStation.count') do
      post local_stations_url, params: { local_station: { distance: @local_station.distance, line: @local_station.line, station: @local_station.station } }
    end

    assert_redirected_to local_station_url(LocalStation.last)
  end

  test "should show local_station" do
    get local_station_url(@local_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_local_station_url(@local_station)
    assert_response :success
  end

  test "should update local_station" do
    patch local_station_url(@local_station), params: { local_station: { distance: @local_station.distance, line: @local_station.line, station: @local_station.station } }
    assert_redirected_to local_station_url(@local_station)
  end

  test "should destroy local_station" do
    assert_difference('LocalStation.count', -1) do
      delete local_station_url(@local_station)
    end

    assert_redirected_to local_stations_url
  end
end
