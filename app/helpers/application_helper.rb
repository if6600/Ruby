module ApplicationHelper
  def avatar_for(user)
    if user.image?
      user.image.url
    else
      'default_avatar.png'
    end
  end

  def default_meta_tags
    {
      site: 'AwesomeMediaService.com',
      title: 'AwesomeMediaService',
      reverse: true,
      separator: '|',
      description: 'Really awesome media-service',
      keywords: 'hse, art, design',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
      #  { href: image_url('favicon.ico') },
      #  { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'AwesomeMediaService.com',
        title: 'AwesomeMediaService',
        description: 'Really awesome media-service',
        type: 'website',
        url: request.original_url,
      #  image: image_url('login-page.png')
      }
    }
  end



end
