class CreatePeaples < ActiveRecord::Migration[8.1]
  def change
    create_table :peaples do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date :birth_date
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
