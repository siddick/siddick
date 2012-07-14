class AuthProvidersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :create ]

  def create
    auth_provider = AuthProvider.find_or_create_by_omniauth(request.env["omniauth.auth"], current_user)
    auth_provider.update_attributes( :auto_publish => true ) if session.delete("auto_publish")
    if current_user
      redirect_to profile_path, :notice => "Updated sucessfully"
    else
      sign_in_and_redirect auth_provider.user, :event => :authentication
      current_user.remember_me!
    end
  end

  def update
    @auth_provider = current_user.auth_providers.find(params[:id])
    provider = @auth_provider.provider.to_sym
    scope    = AuthProvider::AutoPublish[provider]
    if params[:auto_publish] != "true" or scope.blank?
      @auth_provider.update_attributes( :auto_publish => false )
      redirect_to profile_path, :notice => "Updated successfully"
    else
      session["auto_publish"] = true
      session["user_return_to"] = profile_path
      redirect_to "/auth/#{provider}?#{scope.to_param}"
    end
  end

  def destroy
    @auth_provider = current_user.auth_providers.find(params[:id])
    if current_user.auth_providers.count > 1 or current_user.encrypted_password.present?
      @auth_provider.destroy
      redirect_to profile_path, :notice => "Successfully removed"
    else
      redirect_to profile_path, :alert => "No other authentication avilable."
    end
  end

end
