# frozen_string_literal: true

class ErrorsController < ActionController::Base
  rescue_from Exception, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  def show
    raise env["action_dispatch.exception"]
  end

  def not_found
    render file: Rails.root.join("public/404.html"), status: 404, layout: false, content_type: "text/html"
  end

  def internal_server_error
    render file: Rails.root.join("public/500.html"), status: 500, layout: false, content_type: "text/html"
  end
end
