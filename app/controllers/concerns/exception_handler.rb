module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Mongoid::Errors::DocumentNotFound, with: :render_not_found
    rescue_from ActionController::ParameterMissing, with: :render_bad_request
  end

  def render_not_found(exception)
    render json: { status: status_code(:not_found), error: exception.message }, status: :not_found
  end

  def render_bad_request(exception)
    render json: { status: status_code(:bad_request), error: exception.message }, status: :bad_request
  end

  private 
  def status_code(status)
    Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
  end
end
