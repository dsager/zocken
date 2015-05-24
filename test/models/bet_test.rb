require 'test_helper'

class BetTest < ActiveSupport::TestCase
  def setup
    @bet = Bet.new(title: 'some title')
  end
  test '#open sets status to open' do
    assert @bet.open
    assert_equal Bet::STATUS_OPEN, @bet.status
  end
  test '#close sets status to closed' do
    assert @bet.close
    assert_equal Bet::STATUS_CLOSED, @bet.status
  end
  test '#close fails when already closed' do
    assert @bet.close
    assert_raises(RuntimeError) { @bet.close }
  end
  test '#close notifies each result' do
    result = MiniTest::Mock.new
    result.expect(:bet_closed, true)
    @bet.stub(:results, [result]) { assert @bet.close }
  end
end
