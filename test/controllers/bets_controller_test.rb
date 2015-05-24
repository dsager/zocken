require 'test_helper'

class BetsControllerTest < ActionController::TestCase
  setup do
    @bet = bets(:funny_bet)
    assert sign_in(players(:klaus))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bets)
  end

  test "not authenticated should not get :index" do
    not_authenticated :get, :index
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "not authenticated should not get :new" do
    not_authenticated :get, :new
  end

  test "should create bet" do
    assert_difference('Bet.count') do
      post :create,
           bet: {
             description: @bet.description,
             status: @bet.status,
             title: @bet.title }
    end

    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should show bet" do
    get :show, id: @bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet
    assert_response :success
  end

  test "should update bet" do
    patch :update, id: @bet,
          bet: {
            description: @bet.description,
            status: @bet.status,
            title: @bet.title }
    assert_redirected_to bet_path(assigns(:bet))
  end

  test "should destroy bet" do
    assert_difference('Bet.count', -1) do
      delete :destroy, id: @bet
    end

    assert_redirected_to bets_path
  end
end
