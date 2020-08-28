class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  include SessionsHelper
  include AnswersHelper
  include LessonsHelper
  include WordsHelper
  include UsersHelper
  
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

  def existing_users_only
    if User.find_by_id(params[:id]).nil?
      flash[:danger] = "That user does not exist."
      redirect_to root_url
    end
  end
end
