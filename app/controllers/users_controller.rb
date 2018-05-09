class UsersController < ApplicationController

    def new
    
    end 

    def create
        user = User.new
        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.phone = params[:phone]
        user.email = params[:email]
        user.address = params[:address]
        user.country = params[:country]
        user.suburb = params[:suburb]
        user.username = params[:username]
        user.password = params[:password]
        user.profile_url = params[:profile_pic]
        user.save
    
    end 

    def show

    end



end
