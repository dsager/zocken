require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:funny_bet_result_yes)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create,
           result: {
             bet_id: @result.bet_id,
             description: @result.description,
             is_correct: @result.is_correct,
             title: @result.title }
    end

    assert_redirected_to result_path(assigns(:result))
  end

  test "should show result" do
    get :show, id: @result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result
    assert_response :success
  end

  test "should update result" do
    patch :update,
          id: @result,
          result: {
            bet_id: @result.bet_id,
            description: @result.description,
            is_correct: @result.is_correct,
            title: @result.title }
    assert_redirected_to result_path(assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, id: @result
    end

    assert_redirected_to results_path
  end
end
