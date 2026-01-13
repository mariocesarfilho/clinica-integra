require "jwt"

class AuthService
  private

  def self.register(username:, email:, cpf:, periodo:, password:, password_confirmation:)
  raise ArgumentError, "Senhas incopatíveis", password != password_confirmation

    user = User.create!({
      username: username,
      email: email,
      cpf: cpf,
      periodo: periodo,
      password: password,
      password_confirmation: password_confirmation
    })

    token = Rails.application.credentials.secret_key_base

    {
      user_id: user.id,
      token: token
    }
  end
end
