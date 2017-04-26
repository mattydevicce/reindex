require 'test_helper'

class FeedInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feed_info = feed_infos(:one)
  end

  test "should get index" do
    get feed_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_feed_info_url
    assert_response :success
  end

  test "should create feed_info" do
    assert_difference('FeedInfo.count') do
      post feed_infos_url, params: { feed_info: { feed_lang: @feed_info.feed_lang, feed_publisher_name: @feed_info.feed_publisher_name, feed_publisher_url: @feed_info.feed_publisher_url, feed_timezone: @feed_info.feed_timezone, feed_version: @feed_info.feed_version } }
    end

    assert_redirected_to feed_info_url(FeedInfo.last)
  end

  test "should show feed_info" do
    get feed_info_url(@feed_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_feed_info_url(@feed_info)
    assert_response :success
  end

  test "should update feed_info" do
    patch feed_info_url(@feed_info), params: { feed_info: { feed_lang: @feed_info.feed_lang, feed_publisher_name: @feed_info.feed_publisher_name, feed_publisher_url: @feed_info.feed_publisher_url, feed_timezone: @feed_info.feed_timezone, feed_version: @feed_info.feed_version } }
    assert_redirected_to feed_info_url(@feed_info)
  end

  test "should destroy feed_info" do
    assert_difference('FeedInfo.count', -1) do
      delete feed_info_url(@feed_info)
    end

    assert_redirected_to feed_infos_url
  end
end
