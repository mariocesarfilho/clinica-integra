class CreatePeaples < ActiveRecord::Migration[8.1]
  def change
    create_table :peaples do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :birth_date
      t.string :date
      t.string :phone

      t.timestamps
    end
  end
end
