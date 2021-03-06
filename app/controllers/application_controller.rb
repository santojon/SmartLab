class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      #restrict for admin
      if resource.admin
        stored_location_for(resource) || request.referer || root_path
      else
        destroy_user_session_path
      end
    end
  end
end
