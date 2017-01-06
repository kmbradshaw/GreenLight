class User < ActiveRecord::Base
  has_one :redlight

  validates :name, :email, { presence: true }
  validates :email, { uniqueness: true }

  has_secure_password

  def greenlight?
    if self.redlight
      false
    else
      true
    end
  end 
end