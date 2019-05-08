class HomeController < ApplicationController

	def index
		@user = current_user
		redirect_to new_user_session_path
	end

end