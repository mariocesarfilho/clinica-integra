class Peaple < ApplicationRecord
  has_one :therapist, dependent: :destroy
  has_one :responsible, dependent: :destroy
  has_one :patient, dependent: :destroy

  has_secure_papassword

  validates :email, presence: :true, uniqueness: true
  validetes :cpf, presence: :true, uniqueness: true
end
