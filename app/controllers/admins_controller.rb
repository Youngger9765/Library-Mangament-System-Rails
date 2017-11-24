class UsersControllers < ApplicationController
	before_action :authenticate_admin!

	def login

	end

	def main
		@admin = Admin.find(params[:id])
		@books = Book.all
		@users = User.all
	end

	def new

	end
	
end