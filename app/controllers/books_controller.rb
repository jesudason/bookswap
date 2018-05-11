class BooksController < ApplicationController

    def index
        
        # @book = Book.first
        @isbn = params[:isbn_id]
    end

    def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
        # redirect_to '/books/index'
        render :index
    end


    def list_of_books
    	@books = Book.where("#{params[:category]} = '#{params[:search]}'").limit(10)
        # @user = User.find_by(id: "#{params[:user_id]}")
    	render json: @books, include: :user
    end


    def create
        @book = Book.new
        @book.isbn_id = params[:isbn_id]
        @book.title = params[:title]
        @book.author = params[:author]
        @book.image_url = params[:image_url]
        @book.user_id = params[:user_id]
        @book.plot = params[:plot]
        @book.save

        if @book.save
            redirect_to("/#{@book.user_id}/mybooks")
            # raise 'error'
        else
            @errors = @book.errors.full_messages
            render :new
        end

    end 
    
end
