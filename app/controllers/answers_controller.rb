class AnswersController < ApplicationController

  before_action :logged_in_user
  before_action :unstarted_lesson, only: [ :new ]

  def new
    @lesson = Lesson.find(params[:lesson_id])

    @answer = @lesson.answers.build
    @word = unanswered_word @lesson
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    if lesson_finished?(@lesson)
      calculate_results(@lesson)
      redirect_to lesson_url(@lesson)
    else  
      @answer = @lesson.answers.build(answer_params)

      if @answer.save
        redirect_to new_lesson_answer_url(@lesson)
      end
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
    end
end
