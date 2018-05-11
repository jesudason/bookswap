class MybooksController < ApplicationController

	def index
		@user = User.find_by(id: params[:id])
		@books = Book.where(user_id: @user.id)

	end

end
