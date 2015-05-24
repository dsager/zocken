class Player < ActiveRecord::Base
  has_secure_password
  has_many :participations, dependent: :destroy

  # @return [String]
  def email_address_with_name
    "'#{name}' <#{email}>"
  end

  # @param [Result] my_vote
  # @return [Boolean]
  def bet_closed(my_vote)
    if my_vote.is_correct
      increase_points
    else
      decrease_points
    end
  end

  private

  def decrease_points
    if self.points > Rails.configuration.x.players.min_points
      self.points = points - 1
      self.save
    else
      true
    end
  end

  def increase_points
    self.points = points + 1
    self.save
  end

end
