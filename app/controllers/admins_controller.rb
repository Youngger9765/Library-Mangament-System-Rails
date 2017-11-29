class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def main
		@admin = current_admin
		@users = User.all
	end	
end