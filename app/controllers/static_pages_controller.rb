class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user.id)
      render 'users/home_feed'
    end
  end

  def about
  end

  def contact
  end
end
