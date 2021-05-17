module ApplicationHelper
  def avatar_for(user)
    if user.image?
      user.image.url
    else
      'default_avatar.png'
    end
  end

end
