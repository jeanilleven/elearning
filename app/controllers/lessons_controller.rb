class LessonsController < ApplicationController

  before_action :logged_in_user
  before_action :lesson_must_exist, only: [ :show ]
  before_action :unstarted_lesson, only: [ :new ]
  before_action :finished_lesson, only: [ :show ]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 12)
    @lesson = Lesson.new
  end

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    calculate_results(@lesson)
  end

  private
    def lesson_params
      params.require(:lesson).permit(:user_id, :category_id, :result)
    end
end
