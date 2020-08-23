module AnswersHelper
  def unanswered?(word)
    Answer.find_by(word_id: word.id).nil?
  end

  def unanswered_word(lesson)
    x = nil
    lesson.category.words.each do |word|
      if unanswered?(word)
        x = word
        break
      end
    end

    return x
  end

  def count_answers(lesson)
    lesson.answers.count
  end
end
