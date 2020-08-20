module AnswersHelper
  def unanswered?(word)
    Answer.find_by(word_id: word.id).nil?
  end

  def unanswered_word(lesson)
    lesson.category.words.each do |word|
      x = word
      if unanswered?(word)
        return x
      end
    end
  end

  def count_answers(lesson)
    lesson.answers.count
  end
end
