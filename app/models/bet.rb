class Bet < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :results, dependent: :destroy

  STATUS_CLOSED = 0
  STATUS_OPEN   = 1

  def close
    raise 'bet already closed.' if self.status == STATUS_CLOSED
    self.status = STATUS_CLOSED
    results.each { |result| result.bet_closed }
  end

  def open
    self.status = STATUS_OPEN
  end
end
