class WordsController < ApplicationController

  before_action :logged_in_user
  
  def show
    lessons = Lesson.where(user_id: current_user.id)
    @words = find_words(lessons).paginate(page: params[:page], per_page: 10)
  end

  
end
