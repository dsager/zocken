require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include NoAuthTest

  def setup
    assert sign_in(players(:klaus))
  end

  test "authenticated should get index" do
    get :index
    assert_response :success
  end

  test "not authenticated should get redirect" do
    not_authenticated :get, :index
  end
end
