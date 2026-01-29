require "jwt"

module Users
  class AuthService
    # def initialize(username:, email:, cpf:, periodo:, password:, password_confirmation:)
    #   @username = username
    #   @email = email
    #   @cpf = cpf
    #   @periodo = periodo
    #   @password = password
    #   @password_confirmation = password_confirmation
    # end
    #
    def initialize(params)
      @username = params[:username]
      @email = params[:email]
      @cpf = params[:cpf]
      @periodo = params[:periodo]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
    end

    def call
      register
    end
    private

    def register
       user = User.create! ({
        username: @username,
        email: @email,
        cpf: @cpf,
        periodo: @periodo,
        password: @password,
        password_confirmation: @password_confirmation
      })

      payload = { user_id: user.id }
      secret_key = Rails.application.credentials.secret_key_base

      token = JWT.encode(payload, secret_key, "HS256")

      {
        user_id: user.id,
        token: token
      }
    end

    def login
      @user = search_user

       @user.password_digest = gets.strip!

      if BCrypt::Password.new(@user.password).is_password? @password_digest then
        payload = { user_id: @user.id }

        token = Rails.application.credentials.secret_key_base

        JWT.decode(token)
      else
        throw Error("Usuário não encontrado!")
      end
    end

    def search_user
      User.find_by(email: @email)
    end
  end
end
