module ApplicationHelper
  require "uri"

  def text_url_to_link(text)
    URI.extract(text, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end

    return text
  end

	def signed_in?
    redirect_to login_path, notice: 'ログインが必要です。' unless user_signed_in?
	end

  def admin?
    render_404 unless user_signed_in? && current_user.admin?
  end

  def correct_user?(user)
    user_signed_in? && (user == current_user)
  end

  def render_404
    render file: "/public/404.html", status: 404, layout: false
  end
end
