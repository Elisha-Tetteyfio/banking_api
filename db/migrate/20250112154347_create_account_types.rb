class CreateAccountTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :account_types do |t|
      t.string :name
      t.string :alias
      t.text :description

      t.timestamps
    end
  end
end
