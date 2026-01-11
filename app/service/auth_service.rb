require "jwt"

class AuthService
  def initialize(params)
    @params = params
  end


  private

  def self.register(username: username, email: email, cpf: cpf, periodo: periodo, password: password, password_confirmation: password_confirmation)
  raise Exception.new "Senhas incopatíveis", password != password_confirmation
  end
end
