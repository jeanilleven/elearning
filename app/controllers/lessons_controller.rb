class LessonsController < ApplicationController

  before_action :logged_in_user
  before_action only: [ :show ] do 
    lesson_exists(params[:id])
  end
  before_action :unstarted_lesson, only: [ :new ]
  before_action :finished_lesson, only: [ :show ]
  before_action :correct_user, only: [ :show ]

  def index
    @lesson = Lesson.new
    status = params[:status] if params[:status].present?
    

    if status.present?
      @categories = finished_lessons(current_user).paginate(page: params[:page], per_page: 12) if status=="1"
      @categories = unfinished_lessons(current_user).paginate(page: params[:page], per_page: 12) if status=="0"
    else  
      @categories = Category.paginate(page: params[:page], per_page: 12)
    end
  end

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      user = User.find(@lesson.user_id)
      @lesson.create_activity(user: user)
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @words = @lesson.category.words.paginate(page: params[:page], per_page: 10)
  end

  private
    def lesson_params
      params.require(:lesson).permit(:user_id, :category_id, :result, :status)
    end

    def correct_user
      lesson = Lesson.find(params[:id])
      if lesson.user_id != current_user.id
        flash[:danger] = "You are unauthorized to view the page. The result of that lesson does not belong to you."
        redirect_to categories_url
      end
    end
end
