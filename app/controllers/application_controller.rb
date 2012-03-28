class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_admin_user
    current_user.try(:admin?) and current_user
  end

  def authenticate_admin_user!
    unless authenticate_user! and current_admin_user
      redirect_to root_path
    end
  end

end
