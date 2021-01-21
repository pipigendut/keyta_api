require "#{Rails.root}/lib/dtos/expedition_dto"

module ExpeditionApi
  class Cost
    END_POINT = '/v1/costs'.freeze
    HTTP_METHOD = :post

    def initialize(args = {})
      @rest_client = RestClient.new
      @cost_params = args[:cost_params]
    end

    def call
      uri = URI.encode "#{BASE_API}#{END_POINT}"
      body_params = @cost_params
      query_params = {}
      HEADERS.merge!({ 'Authorization': "Bearer #{BEARER_AUTH}" })

      resp = @rest_client.request(uri, HEADERS, HTTP_METHOD, body_params, query_params)
      ExpeditionDto::ResponseCost.new(resp)
    end
  end
end