class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  before_action :logged_in_user, only: [:index, :edit, :update]

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
      flash[:success] = "Welcome to E-learning! You have successfully created an account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile. "
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def correct_user 
      @user = User.find(params[:id])
      if current_user.id != @user.id
        flash[:danger] = "You cannot edit this profile."
        redirect_to user_url(@user.id)
      end
    end
end
