class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to profile_path, :notice => "Updated successfully"
    else
      render :show
    end
  end

  def auto_publish
  end
end
