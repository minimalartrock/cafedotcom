require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get prefecture" do
    get search_prefecture_url
    assert_response :success
  end

end
