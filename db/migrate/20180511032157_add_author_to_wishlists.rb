class AddAuthorToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :author, :string
  end
end
