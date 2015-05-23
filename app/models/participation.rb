class Participation < ActiveRecord::Base
  belongs_to :player
  belongs_to :result
  belongs_to :bet
end
