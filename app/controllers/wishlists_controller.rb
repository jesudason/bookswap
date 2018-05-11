class WishlistsController < ApplicationController

	def index

	end

	def show 
		@my_wishlist = Wishlist.where(user_id: params[:id])
	end

	def destroy
		
		# @user.id = 78
		my_wishlist = Wishlist.find_by(id: params[:id])
		user_id = my_wishlist.user_id
		my_wishlist.destroy
		redirect_to ("/wishlists/#{user_id}")
	end


end
