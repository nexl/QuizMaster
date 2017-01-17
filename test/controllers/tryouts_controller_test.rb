require 'test_helper'

class TryoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tryouts_index_url
    assert_response :success
  end

end
