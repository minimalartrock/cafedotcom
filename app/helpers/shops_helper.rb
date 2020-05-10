# frozen_string_literal: true

module ShopsHelper
  def lazysizes_image_tag(source, options = {})
    options['data-src'] = source
    options[:class] = if options[:class].blank?
                        'lazyload'
                      else
                        "lazyload #{options[:class]}"
                      end
    image_tag('/public/loading.gif', options)
  end

  def shop_for(shop)
    if shop.image.attached?
      shop.image
    else
      '/images/default-shop.jpg'
    end
  end
end
