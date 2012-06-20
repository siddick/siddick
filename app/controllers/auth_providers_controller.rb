class AuthProvidersController < ApplicationController
  def create
    auth_provider = AuthProvider.find_or_create_by_omniauth(request.env["omniauth.auth"], current_user)
    sign_in_and_redirect auth_provider.user, :event => :authentication
  end
end
