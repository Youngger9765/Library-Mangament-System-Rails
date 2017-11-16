class UsersControllers < ApplicationController
	before_action :authenticate_user!

end