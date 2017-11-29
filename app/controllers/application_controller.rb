class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if current_admin
  		admins_main_path(current_admin)
  	else
  		users_main_path(current_user)
  	end
  end
end
