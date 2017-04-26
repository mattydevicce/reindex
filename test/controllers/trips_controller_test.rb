require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { direction_id: @trip.direction_id, route_id: @trip.route_id, service_id: @trip.service_id, shape_id: @trip.shape_id, trip_headsign: @trip.trip_headsign, trip_id: @trip.trip_id, trip_short_name: @trip.trip_short_name } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { direction_id: @trip.direction_id, route_id: @trip.route_id, service_id: @trip.service_id, shape_id: @trip.shape_id, trip_headsign: @trip.trip_headsign, trip_id: @trip.trip_id, trip_short_name: @trip.trip_short_name } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
