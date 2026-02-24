class Patient < ApplicationRecord
  belongs_to :peaple

  delegate :name, :birth_date, to: :peaple
end
