class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def main
		@users = User.all
	end	

end