class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :cpf, presence: true, uniqueness: true


  ROLE={
    1 => "TERAPEUTA",
    2 => "USER"
  }

  def user_terapist?
    if user.role == 1
      true
    else
      false
    end
  end
end
