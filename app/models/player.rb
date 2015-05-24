class Player < ActiveRecord::Base
  has_secure_password
  has_many :participations, dependent: :destroy

  def email_address_with_name
    "'#{name}' <#{email}>"
  end

  def bet_closed(succes, bet)
    true
  end
end
