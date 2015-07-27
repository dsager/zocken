module Zocker
  module Agents
    module Actions
      module CreateBet
        def create_bet(data)
          # POST /bets.json
          {
            title: 'Some bet',
            description: 'This is a very nice bet!',
            status: Bet::STATUS_OPEN
          }
          true
        end
      end
    end
  end
end
