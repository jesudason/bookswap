class AddLatdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latd, :string
  end
end
