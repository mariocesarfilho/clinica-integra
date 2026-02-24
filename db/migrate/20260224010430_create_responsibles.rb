class CreateResponsibles < ActiveRecord::Migration[8.1]
  def change
    create_table :responsibles do |t|
      t.timestamps
    end
  end
end
