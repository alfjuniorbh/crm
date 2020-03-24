module ApplicationHelper
  def resize_image(image, size)
    if image.present?
      image.variant(resize_to_fit: [size, size])
    else
      "#{Rails.root}/spec/fixtures/thumb.png"
    end
  end
end
