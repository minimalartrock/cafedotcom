module ShopsHelper
  def lazysizes_image_tag(source, options = {})
    options["data-src"] = source
    if options[:class].blank?
      options[:class] = "lazyload"
    else
      options[:class] = "lazyload #{options[:class]}"
    end
    image_tag("/public/loading.gif", options)
  end

  def shop_for(shop)
    if shop.image.attached?
      shop.image
    else
      "/images/default-shop.jpg"
    end
  end

  def recently_commented_shops
    Shop.includes(:comments).order("comments.created_at DESC NULLS LAST").limit(5)
  end
end
