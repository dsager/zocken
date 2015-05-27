require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:funny_bet_result_yes)
    @bet = @result.bet
    @player = players(:klaus)
    assert sign_in(@player)
  end

  test "should get index" do
    get :index, bet_id: @bet.id
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new, bet_id: @bet.id
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, bet_id: @bet.id,
           result: {
             bet_id: @result.bet_id,
             description: @result.description,
             is_correct: @result.is_correct,
             title: @result.title }
    end

    assert_redirected_to bet_result_path(@bet, assigns(:result))
  end

  test "should show result" do
    get :show, bet_id: @bet.id, id: @result
    assert_response :success
  end

  test "should get edit" do
    get :edit, bet_id: @bet.id, id: @result
    assert_response :success
  end

  test "should update result" do
    patch :update,
          bet_id: @bet.id,
          id: @result,
          result: {
            bet_id: @result.bet_id,
            description: @result.description,
            is_correct: @result.is_correct,
            title: @result.title }
    assert_redirected_to bet_result_path(@bet, assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, bet_id: @bet.id, id: @result
    end
    assert_redirected_to bet_results_path(@bet)
  end
end
