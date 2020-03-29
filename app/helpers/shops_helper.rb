module ShopsHelper
  def lazy_image_tag(source, options = {})
    puts source
    options["data-original"] = source
    if options[:class].blank?
      options[:class] = "lazy"
    else
      options[:class] = "lazy #{options[:class]}"
    end

    image_tag("/rolling.gif", options)
  end
end
