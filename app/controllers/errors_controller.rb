# frozen_string_literal: true

class ErrorsController < ActionController::Base
  rescue_from StandardError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  def show
    raise env['action_dispatch.exception']
  end

  def not_found
    render template: 'errors/not_found', status: 404, layout: 'application', content_type: 'text/html'
  end

  def internal_server_error
    render template: 'errors/internal_server_error', status: 500, layout: 'application', content_type: 'text/html'
  end
end
