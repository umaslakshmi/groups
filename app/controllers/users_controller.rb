class UsersController < ApplicationController
	def index
	end

	def create
		user = User.create(user_params)
		if user.valid?
			session[:id] = user.id
			redirect_to '/groups'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/main'
		end
	end

	def login
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to '/groups'
		else
			flash[:errors] = ["Invalid email or password"]
			redirect_to '/main'
		end
	end

	def logout
		session[:id] = nil
		redirect_to '/main'
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
