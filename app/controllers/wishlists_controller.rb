class WishlistsController < ApplicationController

	def index

	end

	def show 
		@my_wishlist = Wishlist.where(user_id: 75)
	end

	def destroy
		my_wishlist = Wishlist.where(params[:user_id])
		my_wishlist.destroy
		redirect_to ("/wishlist/'#{ user_id }'")
	end


end
