module UsersHelper
  def user_avatar(user, classes)
    @avatar = user.avatar

    if @avatar.present?
      image_tag(@avatar.url, class: classes)
    else
      image_tag("dp.png", class: classes)
    end
  end
end
