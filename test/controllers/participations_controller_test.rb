require 'test_helper'

class ParticipationsControllerTest < ActionController::TestCase
  setup do
    @participation = participations(:klaus_funny_bet)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participation" do
    assert_difference('Participation.count') do
      post :create,
           participation: {
             bet_id: @participation.bet_id,
             player_id: @participation.player_id,
             result_id: @participation.result_id }
    end

    assert_redirected_to participation_path(assigns(:participation))
  end

  test "should show participation" do
    get :show, id: @participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participation
    assert_response :success
  end

  test "should update participation" do
    patch :update,
          id: @participation,
          participation: {
            bet_id: @participation.bet_id,
            player_id: @participation.player_id,
            result_id: @participation.result_id }
    assert_redirected_to participation_path(assigns(:participation))
  end

  test "should destroy participation" do
    assert_difference('Participation.count', -1) do
      delete :destroy, id: @participation
    end

    assert_redirected_to participations_path
  end
end
