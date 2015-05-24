class Participation < ActiveRecord::Base
  belongs_to :player
  belongs_to :result, counter_cache: true
  belongs_to :bet

  def bet_closed(success)
    player.bet_closed(success, bet)
  end
end
