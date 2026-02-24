class AddPeapleToTherapists < ActiveRecord::Migration[8.1]
  def change
    add_reference :therapists, :peaple, null: false, foreign_key: true
  end
end
