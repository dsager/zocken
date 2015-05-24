require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @player = players(:klaus)
  end

  test '#email_address_with_name' do
    assert_equal "'Klaus' <klaus@foo.bar>", @player.email_address_with_name
  end

  test '#bet_closed with success increases points' do
    result = results(:funny_bet_result_yes)
    initial_points = @player.points
    assert @player.bet_closed(result)
    assert initial_points < @player.points
  end

  test '#bet_closed with failure decreases points' do
    result = results(:funny_bet_result_no)
    initial_points = @player.points
    assert @player.bet_closed(result)
    assert initial_points > @player.points
  end

  test '#bet_closed with failure does not decrease points below X' do
    player = players(:werner)
    result = results(:funny_bet_result_no)
    initial_points = player.points
    assert player.bet_closed(result)
    assert_equal initial_points, player.points
  end
end
