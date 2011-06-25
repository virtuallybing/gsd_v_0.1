class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
