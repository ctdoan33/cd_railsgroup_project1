class UsersController < ApplicationController
	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:id] = user.id
			redirect_to "/posts"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/new"
		end
	end

	def show
	end

	def edit
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
