class UsersController < ApplicationController

  def index
    if !logged_in?
      redirect_to login_url
    else
      @users = User.paginate(page: params[:page], per_page: 9)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to signup_url
    else
      render 'new'
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
