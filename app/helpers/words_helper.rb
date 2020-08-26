module WordsHelper
  def find_words(lessons)
    words = []

    lessons.each do |lesson|
      lesson.words.each do |word|
        answer = user_answer(lesson, word)
        correct_choice = Choice.where(word_id: word.id, isCorrect: 1)
        words.push(word: word, answer: answer, correct_choice: correct_choice)
      end
    end

    return words
  end
end
