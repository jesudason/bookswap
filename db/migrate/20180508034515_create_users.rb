class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone
      t.string :email, null: false
      t.text :profile_url, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :address, null: false
      t.string :suburb, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
