module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

    # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

    # Returns the current logged-in user (if any) else returns nil.
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
