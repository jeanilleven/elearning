class ApplicationController < ActionController::Base
  include SessionsHelper
  include AnswersHelper
  include LessonsHelper
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please login first."
      redirect_to login_url
    end
  end

  def admin_only
    if !current_user.isAdmin
      flash[:danger] = "You are not authorized to access the admin dashboard."
      redirect_to user_url(current_user.id)
    end
  end
end
