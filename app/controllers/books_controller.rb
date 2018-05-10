class BooksController < ApplicationController

    def index
        
        # @book = Book.first
        @isbn = params[:isbn_id]
    end

end
