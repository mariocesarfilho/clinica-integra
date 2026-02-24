class AddPeapleToResponsibles < ActiveRecord::Migration[8.1]
  def change
    add_reference :responsibles, :peaple, null: false, foreign_key: true
  end
end
