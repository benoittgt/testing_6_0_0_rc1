require 'test_helper'

class ShowMeRspecControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get show_me_rspec_index_url
    assert_response :success
  end

end
