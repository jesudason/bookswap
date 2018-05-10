class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(create_params)
        if @user.save
            redirect_to('/')
        else
            @errors = @user.errors.full_messages
            render :new
        end
    end 

    def show

    end

    def create_params
        params.require(:user).permit(:first_name, :last_name, :phone, :email, :address, :country, :suburb, :username, :password, :profile_url)
    end



end
