require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  def setup
    @participation = participations(:klaus_funny_bet)
    @result = @participation.result
    @player = MiniTest::Mock.new
  end

  test '#bet_closed calls #bet_closed on player' do
    @player.expect(:bet_closed, true, [@result])
    @participation.stub(:bet, :bet) do
      @participation.stub(:player, @player) do
        assert @participation.bet_closed
      end
    end
  end
end
