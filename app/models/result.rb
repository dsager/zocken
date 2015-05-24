class Result < ActiveRecord::Base
  belongs_to :bet
  has_many :participations, dependent: :destroy

  def bet_closed
    participations.each { |participation| participation.bet_closed(is_correct) }
    true
  end
end
