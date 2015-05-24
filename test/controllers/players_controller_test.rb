require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    assert sign_in(players(:klaus))
    @player = players(:klaus)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  # test "should update player" do
  #   patch :update, id: @player,
  #         player: {
  #           email: @player.email,
  #           name: @player.name,
  #           password: 'secret',
  #           password_confirmation: 'secret',
  #           points: @player.points }
  #   assert_redirected_to player_path(assigns(:player))
  # end
  # FIXME: change devise route

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
