class AuthorizeToken < ApplicationRecord
  has_many :links
  
  after_create :generate_token

  def generate_token
    self.update_attribute(:token, ::JsonWebToken.encode(id: self.id, name: self.name))
  end
end