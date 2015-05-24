class Result < ActiveRecord::Base
  belongs_to :bet
  has_many :participations, dependent: :destroy

  def bet_closed
    participations.each(&:bet_closed)
    true
  end
end
