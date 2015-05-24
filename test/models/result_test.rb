require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  def setup
    @bet = Bet.new(title: 'some title')
    @result = Result.new(title: 'some title', bet: @bet)
  end

  test '#bet_closed notifies each participant with true' do
    @result.is_correct = true
    participation = MiniTest::Mock.new
    participation.expect(:bet_closed, true, [true])
    @result.stub(:participations, [participation]) { assert @result.bet_closed }
  end

  test '#bet_closed notifies each participant with false' do
    @result.is_correct = false
    participation = MiniTest::Mock.new
    participation.expect(:bet_closed, true, [false])
    @result.stub(:participations, [participation]) { assert @result.bet_closed }
  end
end
