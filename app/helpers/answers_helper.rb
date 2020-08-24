module AnswersHelper
  def unanswered_by_user?(user, word)
    user.answers.select{ |answer| answer.word_id == word.id }.empty?
  end

  def unanswered_word(lesson)
    x = nil
    lesson_taker = User.find(lesson.user_id)
    
    lesson.category.words.each do |word|
      if unanswered_by_user?(lesson_taker,word)
        x = word
        break
      end
    end

    return x
  end

end
