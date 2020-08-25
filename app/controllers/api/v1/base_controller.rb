module Api::V1
  class BaseController < ApplicationController
    include Renderer

    rescue_from Mongoid::Errors::DocumentNotFound, with: :render_not_found_response

    def render_not_found_response(exception)
      render json: { status: 404, error: exception.message }, status: :not_found
    end
  end
end