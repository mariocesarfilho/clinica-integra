require "jwt"

class AuthService
  def self.register(username:, email:, password:, password_confirmation:, cpf:)
    raise ArgumentError, "Senhas não coincidem" if password != password_confirmation


    password_hashed = AuthPassword.password_coded(password)

    user = User.create!(
      username: username,
      email: email,
      password: password,
      password_digest: password_hashed,
      cpf: cpf
    )

    JWT.encode(user_id: user.id)

    {
      user: user,
      token: token
    }
  end

  def self.login(email, password)
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JWT.encode(user_id: user.id)

      render json: { token: token }, status: :ok
    else
      render json: { token: "Email ou Senha inválido" }
    end
  end
end
