class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
		if user
			session[:id] = user.id
			redirect_to "/posts"
		else
			redirect_to "/sessions/new", notice: "Email and password do not match"
		end
	end

	def destroy
		session[:id] = nil
		redirect_to "/sessions/new"
	end
end
