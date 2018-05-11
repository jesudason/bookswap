class AddImageUrlToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :image_url, :text
  end
end
