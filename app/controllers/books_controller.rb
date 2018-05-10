class BooksController < ApplicationController
    def index
        # raise 'error'
        @book = Book.first
    end
end
