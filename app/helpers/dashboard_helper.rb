module DashboardHelper
  def banner_image_for(store, options = {})
    default_class = "w-full h-24 object-cover"

    if store.banner_image.attached?
      image_tag(store.banner_image, class: options[:class] || default_class)
    else
      image_tag("default_banner.jpg", class: options[:class] || default_class)
    end
  end
end
