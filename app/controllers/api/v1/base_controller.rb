module Api::V1
  class BaseController < ApplicationController
    include Renderer
    include ExceptionHandler

    # Parse query param "q"
    # Return the hash of criteria or an empty hash the represents "no criteria"
    def search_params
      return {} unless params[:q]
      params.require(:q).permit!
    end
  end
end