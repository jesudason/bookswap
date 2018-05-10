class WishlistsController < ApplicationController

	def index

	end

	def show 
		@my_wishlist = Wishlist.where(user_id: 25)
	end

end
