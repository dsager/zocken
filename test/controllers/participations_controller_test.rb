require 'test_helper'

class ParticipationsControllerTest < ActionController::TestCase
  setup do
    @player = players(:klaus)
    @participation = participations(:klaus_funny_bet)
    assert sign_in(@player)
  end

  test "should get index" do
    get :index, player_id: @player
    assert_response :success
    assert_not_nil assigns(:participations)
  end

  test "should get new" do
    get :new, player_id: @player
    assert_response :success
  end

  test "should create participation" do
    assert_difference('Participation.count') do
      post :create, player_id: @player,
           participation: {
             bet_id: @participation.bet_id,
             player_id: @participation.player_id,
             result_id: @participation.result_id }
    end

    assert_redirected_to player_participation_path(@player, assigns(:participation))
  end

  test "should show participation" do
    get :show, player_id: @player, id: @participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, player_id: @player, id: @participation
    assert_response :success
  end

  test "should update participation" do
    patch :update, player_id: @player,
          id: @participation,
          participation: {
            bet_id: @participation.bet_id,
            player_id: @participation.player_id,
            result_id: @participation.result_id }
    assert_redirected_to player_participation_path(@player, assigns(:participation))
  end

  test "should destroy participation" do
    assert_difference('Participation.count', -1) do
      delete :destroy, player_id: @player, id: @participation
    end

    assert_redirected_to player_participations_path(@player)
  end
end
