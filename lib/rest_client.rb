class RestClient
  include HTTParty

  def request(uri, headers, http_method, body_params, query_params)
    HTTParty.send http_method, uri, headers: headers, query: query_params, body: body_params.to_json, verify: false
  rescue StandardError => e
    Rails.logger.error(e)
  end
end
