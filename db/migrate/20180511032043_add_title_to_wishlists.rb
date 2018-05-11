class AddTitleToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :title, :string
  end
end
