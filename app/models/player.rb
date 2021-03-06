class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, :lockable
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
    else
      true
    end
  end

  def increase_points
    self.points = points + 1
  end

end
