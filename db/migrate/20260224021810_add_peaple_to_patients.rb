class AddPeapleToPatients < ActiveRecord::Migration[8.1]
  def change
    add_reference :patients, :peaple, null: false, foreign_key: true
  end
end
