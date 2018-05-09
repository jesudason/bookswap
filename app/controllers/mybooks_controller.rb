class MybooksController < ApplicationController

	def index
		@books = Book.where(user_id: current_user.id)
	end
end
