# frozen_string_literal: true
module JsonHelpers
  def json(response)
    JSON.parse(response.body)
  end

  def json_data(response)
    json(response)['data']
  end

  def json_meta(response)
    json(response)['meta']
  end

  def json_errors(response)
    json(response)['errors']
  end
end
