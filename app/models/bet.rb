class Bet < ActiveRecord::Base
  has_many :participations
  has_many :results

  STATUS_CLOSED=0
  STATUS_OPEN=1
end
