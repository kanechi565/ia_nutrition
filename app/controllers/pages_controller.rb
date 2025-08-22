class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def profile
    @user = current_user
  end

  # DELETE /profile/photo
  def destroy_photo
    current_user.photo.purge if current_user.photo.attached?
    redirect_to profile_path
  end
end
