class User < ActiveRecord::Base

  def password
    BCrypt::Password.new(password_hash)
  end

  def password=(plain_text_password)
    self.password_hash = BCrypt::Password.create(plain_text_password)
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

end
