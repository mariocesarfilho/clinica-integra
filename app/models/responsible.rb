class Responsible < ApplicationRecord
  belongs_to :people

  delegate :name, :cpf, :email, :phone, to: :peaple
end
