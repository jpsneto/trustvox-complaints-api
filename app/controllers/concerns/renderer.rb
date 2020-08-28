# frozen_string_literal: true
module Renderer
  def render_object(resource, **options)
    is_collection = resource.respond_to?(:each)

    options.merge!(json: resource, root: is_collection ? :data : false)
    options.merge!(status: :ok) unless options.key?(:status)
    options.merge!(meta: assign_metadata(resource)) if is_collection

    render options
  end

  def render_errors(errors, status = :unprocessable_entity)
    render json: { errors: errors.messages }, status: status
  end

  private

  def assign_metadata(resource)
    count = resource.respond_to?(:count) ? resource.count : 1
    page_infos = { number: resource.current_page, size: resource.limit_value }

    { total: count, page: page_infos }
  end
end
