class MybooksController < ApplicationController

	def index
		@user = User.find_by(username: params[:username])
		@books = Book.where(user_id: @user.id)

	end

end
