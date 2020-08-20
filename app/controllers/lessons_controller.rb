class LessonsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.paginate(page: params[:page], per_page: 12)
  end

  private
    def lessons_params
      params.require(:lesson).permit(:user_id, :category_id, :result)
    end
end
