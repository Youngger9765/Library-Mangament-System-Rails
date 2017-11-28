class UsersController < ApplicationController
	
	before_action :authenticate_user!
	def main
		@user = current_user
		@book = Book.all
	end
	
end