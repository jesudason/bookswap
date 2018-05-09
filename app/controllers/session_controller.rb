class SessionController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/users/:id" 
		else
			redirect_to('/')
		end		
	end

	def destroy
		session[:user_id] = nil
		redirect_to('/')
	end

end