module UsersHelper
  def user_avatar(user, classes)
    @avatar = user.avatar

    if @avatar.present?
      image_tag(@avatar.url, class: classes)
    else
      image_tag("dp.png", class: classes)
    end
  end

  def words_learned(user)
    result = 0
    lessons = Lesson.where(user_id: user.id)

    lessons.each do |l|
      result+=l.result
    end

    return result
  end
end
