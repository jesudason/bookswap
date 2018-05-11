class WishlistsController < ApplicationController

	def index

	end

	def show 
		@wishlists = Wishlist.where(user_id: params[:id])
	end

	def create
        @wishlist = Wishlist.new
        @wishlist.user_id = params[:user_id]
        @wishlist.isbn_id = params[:isbn_id]
        @wishlist.title = params[:title]
        @wishlist.author = params[:author]
        @wishlist.image_url = params[:image_url]
        @wishlist.save


        if @wishlist.save
            redirect_to("/wishlists/#{@wishlist.user_id}")
        else
            @errors = @wishlist.errors.full_messages
            raise 'error'
            redirect_to("/")
        end

	end

	def destroy
		
		# @user.id = 78
		my_wishlist = Wishlist.find_by(id: params[:id])
		user_id = my_wishlist.user_id
		my_wishlist.destroy
		redirect_to ("/wishlists/#{user_id}")
	end


end
