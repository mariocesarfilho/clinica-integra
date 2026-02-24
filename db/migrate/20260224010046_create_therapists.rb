class CreateTherapists < ActiveRecord::Migration[8.1]
  def change
    create_table :therapists do |t|
      t.timestamps
    end
  end
end
