class BooksController < ApplicationController

    def index
        
        # @book = Book.first
        @isbn = params[:isbn_id]
    end

    def list_of_books
    	@books = Book.where("#{params[:category]} = '#{params[:search]}'").limit(10)
    	render json: @books
    end

end
