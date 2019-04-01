module EmailHelper
  def fallback_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("app/assets/images/#{image}"))
    image_tag attachments[image].url, **options
  end

  def email_image_tag(image, **options)
      attachments[image.url] = image.url
      image_tag attachments[image.url].filename, **options
  end

  def logo_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("app/assets/images/#{image}"))
    image_tag attachments[image].url, **options
  end
end
