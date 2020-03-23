module ApplicationHelper
  def resize_image(image, size)
     image.variant(resize_to_fit: [size, size])
  end
end
