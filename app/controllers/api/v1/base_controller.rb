module Api::V1
  class BaseController < ApplicationController
    include Renderer
    include ExceptionHandler
  end
end