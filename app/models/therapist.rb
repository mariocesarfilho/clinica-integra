class Therapist < ApplicationRecord
  belongs_to :peaple

  delegate :name, :cpf, :email, :phone, :birth_date, to: :peaple
end
