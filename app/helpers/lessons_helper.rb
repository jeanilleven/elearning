module LessonsHelper
  def calculate_results(lesson)
    result = 0

    lesson.answers.each do |answer|
      word = Word.find(answer.word_id)
      if answer.choice_id == word.correct_choice.id 
        result+=1
      end
    end
    lesson.update_attributes(result: result)
  end

  def lesson_finished?(lesson)
    lesson.category.words.count==lesson.answers.count
  end

  def unstarted_lesson 
    if params[:lesson_id].present?
      @lesson = Lesson.find(params[:lesson_id])
      if lesson_finished?(@lesson) 
        flash[:info] = "You already finished this lesson."
        redirect_to lesson_url(@lesson)
      end
    end
  end

  def answered_category?(user, category)
    return Lesson.find_by(category_id: category.id, user_id: user.id)
  end

  def finished_lesson
    lesson = Lesson.find(params[:id])
    if !lesson_finished?(lesson)
      flash[:danger] = "This result can still change. You can still continue answering this lesson. "
    end
  end

  def lesson_must_exist
    if Lesson.find_by(id: params[:lesson_id]).nil?
      flash[:danger] = "This lesson has not been initiated. You may start taking a lesson by choosing from the categories below."
      redirect_to categories_url
    end
  end
end
