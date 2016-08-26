class MembersController < ApplicationController
	before_action :require_login

	def create
		Member.create(user: User.find(session[:id]), group: Group.find(params[:group_id]))
		redirect_to :back
	end

	def destroy
		Member.where(user: User.find(session[:id]), group: Group.find(params[:group_id])).first.destroy
		redirect_to :back
	end
end
