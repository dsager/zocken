class Player < ActiveRecord::Base
  has_secure_password
  has_many :participations

  def email_address_with_name
    "'#{name}' <#{email}>"
  end
end
