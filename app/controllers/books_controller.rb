class BooksController < ApplicationController

    def index
        # raise 'error'
        @book = Book.first
    end


	def index
			@book = Book.first
	end


end
