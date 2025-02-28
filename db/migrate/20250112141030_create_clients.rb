class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
