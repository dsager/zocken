require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  def setup
    @player = MiniTest::Mock.new
    @participation = Participation.allocate
  end

  test '#bet_closed calls #bet_closed on player' do
    @player.expect(:bet_closed, true, [true, :bet])
    @participation.stub(:bet, :bet) do
      @participation.stub(:player, @player) do
        assert @participation.bet_closed(true)
      end
    end
  end
end
