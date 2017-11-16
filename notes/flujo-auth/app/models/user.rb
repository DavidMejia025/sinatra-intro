class User < ActiveRecord::Base
  # include BCrypt

  def password
    BCrypt::Password.new(self.hashed_password)
  end

  def password=(plain_password)
    self.hashed_password = BCrypt::Password.create(plain_password)
  end

  def authenticate(plain_password)
    self.password == plain_password
  end


end
