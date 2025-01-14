class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.references :account_type, null: false, foreign_key: true
      t.string :account_number
      t.decimal :balance, default: 0.0
      t.boolean :active_status, default: true
      t.datetime :date_closed, default: nil

      t.timestamps
    end
  end
end
