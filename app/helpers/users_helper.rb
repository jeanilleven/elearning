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
      result+=l.result if !l.result.nil?
    end

    return result
  end

  def find_relationship(rel)
    relationship = Relationship.find(rel)
    return User.find(relationship.followed_id)
  end

  def feed(user)
    feed = []
    activities = Activity.all.order('updated_at DESC')

    activities.each do |activity|
      doer = User.find(activity.user_id)
      if doer.id == user.id || user.following?(doer)
        feed.push(activity)
      end
    end

    return feed 
  end 

  def activities(user)
    feed = []
    activities = Activity.all.order('updated_at DESC')

    activities.each do |activity|
      doer = User.find(activity.user_id)
      if doer.id == user.id
        feed.push(activity)
      end
    end

    return feed 
  end
end
