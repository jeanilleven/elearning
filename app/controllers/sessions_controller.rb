class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    user = User.find_by( email: params[:session][:email].downcase )

    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You have successfully logged in! "
      log_in user
      redirect_to root_url
    else 
      flash[:danger] = "Invalid Credentials."
      render 'new'
    end

  end

  def destroy
    log_out
    flash[:success] = "You have successfully logged out!"
    redirect_to root_url
  end
end
