# frozen_string_literal: true

module ApplicationHelper
  require 'uri'

	APP_TITLE = 'カフェどっと混む'
	APP_URL = 'https://cafedotcom.jp/'
	APP_DESCRIPTION = 'カフェの混雑状況が確認できるサイトです。お店の情報や口コミを見ることができます。'
	APP_THUMBNAIL = 'https://cafedotcom.jp/images/thumbnail.png'

	def full_title(page_title = '')
		base_title = APP_TITLE
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def og_url(page_url = '')
		page_url.empty? ? APP_URL : page_url
	end

	def og_title(page_title = '')
		page_title.empty? ? APP_TITLE : page_title
	end

	def og_description(page_description = '')
		page_description.empty? ? APP_DESCRIPTION : page_description
	end

	def og_image(page_image = '')
		page_image.empty? ? APP_THUMBNAIL : page_image
	end

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = ''
      sub_text << '<a href=' << url << ' target="_blank">' << url << '</a>'

      text.gsub!(url, sub_text)
    end

    text
  end

  def signed_in?
    redirect_to login_path, notice: 'ログインが必要です。' unless user_signed_in?
  end

  def correct_user?
    render_404 unless user_signed_in? && (params[:id].to_i == current_user.id)
  end

  def admin?
    render_404 unless user_signed_in? && current_user.admin?
  end

  def render_404
    render file: '/public/404.html', status: 404, layout: false
  end
end
