class AuthPassword
  def self.password_coded(password)
    BCrypt::Password.create(password)
  end
end
