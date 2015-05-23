class Result < ActiveRecord::Base
  belongs_to :bet
  has_many :participations
end
