class UsersControllers < ApplicationController
	before_action :authenticate_user!

	def login

	end

	def main
		@user = User.find(params[:id])
		@books = Book.all
	end

end