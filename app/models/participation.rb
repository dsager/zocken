class Participation < ActiveRecord::Base
  belongs_to :player
  belongs_to :result, counter_cache: true
  belongs_to :bet

  def bet_closed
    player.bet_closed(result)
  end
end
