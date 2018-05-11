class AddIsbnIdToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :isbn_id, :string
  end
end
