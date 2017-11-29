class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def main
		@admin = current_admin
		@users = User.all
	end	
	def fine
		@user = User.find(params[:id])
		@user.balance = @user.balance - 10
		@user.save
		redirect_to admins_main_path(current_admin)
	end
end