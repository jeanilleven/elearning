class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user.id)
      @activities = feed(@user).paginate(page: params[:page], per_page: 10)
      render 'users/home_feed'
    end
  end

  def about
  end

  def contact
  end
end
