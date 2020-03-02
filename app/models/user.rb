class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  before_create { generate_token(:auth_token) }

  #self refers to the object that is currently in context.
  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64 #SecureRandom  generate a random string
      #no other user exists with that token and repeatedly generate another random token while this is true
    end while User.exists?(column => self[column]) #

  end

end
