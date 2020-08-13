class Admin::StaticPagesController < ApplicationController

  before_action :logged_in_user, only: [:home]

  def home
    if !current_user.isAdmin
      flash[:danger] = "You are not authorized to access the admin dashboard."
      redirect_to user_url(current_user.id)
    end
  end
end
