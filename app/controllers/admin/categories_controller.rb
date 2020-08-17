class Admin::CategoriesController < ApplicationController

  before_action :logged_in_user
  before_action :admin_only

  def index
    @categories = Category.paginate(page: params[:page], per_page: 9).order('updated_at DESC')
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "You have successfully added a new category!"
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = "You have successfully updated the category!"
      
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:warning] = "You have successfully deleted the category!"
      redirect_to admin_categories_url
    else
      flash[:danger] = "You cannot delete this category!"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
end
