class Admin::UsersController < ApplicationController

  before_action :logged_in_user
  before_action :admin_only

  def index
    @users = User.paginate(page: params[:page], per_page: 9)
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(isAdmin: '1')
    flash[:success] = "You successfully made #{user.name} an admin."

    redirect_back(fallback_location: root_path)
  end

end
