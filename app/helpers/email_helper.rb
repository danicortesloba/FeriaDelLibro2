module EmailHelper
  def email_image_tag(image, **options)
    if image.url =~ /fallback/
      attachments[image.url] = File.read(Rails.root.join("public/#{image.url}"))
      image_tag attachments[image.url].filename, **options
    else
      attachments[image.url] = image.url
      image_tag attachments[image.url].filename, **options
    end
  end

  def logo_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("app/assets/images/#{image}"))
    image_tag attachments[image].url, **options
  end
end
