class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_only

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 10).order('updated_at DESC')
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "You have successfully added a new word"
      redirect_to admin_category_words_url(@category)
    else 
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])

    if @word.update_attributes(word_params)
      flash[:success] = "You have successfully updated the word!"
      redirect_to admin_category_words_url(@category)
    else 
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])

    if @word.destroy
      flash[:warning] = "You have successfully deleted the word."
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def word_params
      params.require(:word).permit(:id, :content, { choices_attributes: [ :id, :content, :isCorrect ] })
    end
end
