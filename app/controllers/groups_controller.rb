class GroupsController < ApplicationController
	before_action :require_login
	# before_action :require_correct_user, only:[:create, :destroy]

	def index
		@user = User.find(session[:id])
		@groups = Group.all
	end

	def create
		group = Group.create(group_params)
		group.update(user: User.find(session[:id]))
		if group.valid?
			Member.create(user: User.find(session[:id]), group: group)
		else
			flash[:errors] = group.errors.full_messages
		end
		redirect_to '/groups'
	end

	def destroy
		Group.find(params[:id]).destroy
		redirect_to '/groups'
	end

	def show
		@group = Group.find(params[:id])
		@user = User.find(session[:id])
	end

	private
	def group_params
		params.require(:group).permit(:name, :description)
	end
end
