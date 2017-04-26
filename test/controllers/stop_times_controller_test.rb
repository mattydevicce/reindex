require 'test_helper'

class StopTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stop_time = stop_times(:one)
  end

  test "should get index" do
    get stop_times_url
    assert_response :success
  end

  test "should get new" do
    get new_stop_time_url
    assert_response :success
  end

  test "should create stop_time" do
    assert_difference('StopTime.count') do
      post stop_times_url, params: { stop_time: { arrival_time: @stop_time.arrival_time, departure_time: @stop_time.departure_time, stop: @stop_time.stop, stop_id: @stop_time.stop_id, trip_id: @stop_time.trip_id } }
    end

    assert_redirected_to stop_time_url(StopTime.last)
  end

  test "should show stop_time" do
    get stop_time_url(@stop_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_stop_time_url(@stop_time)
    assert_response :success
  end

  test "should update stop_time" do
    patch stop_time_url(@stop_time), params: { stop_time: { arrival_time: @stop_time.arrival_time, departure_time: @stop_time.departure_time, stop: @stop_time.stop, stop_id: @stop_time.stop_id, trip_id: @stop_time.trip_id } }
    assert_redirected_to stop_time_url(@stop_time)
  end

  test "should destroy stop_time" do
    assert_difference('StopTime.count', -1) do
      delete stop_time_url(@stop_time)
    end

    assert_redirected_to stop_times_url
  end
end
