class MybooksController < ApplicationController

	def index
		@user = User.find_by(id: params[:id])
		@books = Book.where(user_id: @user.id)
	end

	def destroy
		book = Book.find_by(id: params[:id])
		user_id = book.user_id
		book.destroy
		redirect_to ("/#{user_id}/mybooks")
	end

end
