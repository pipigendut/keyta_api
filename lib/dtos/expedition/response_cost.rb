module ExpeditionDto
  class ResponseCost
    include ApplicationHelper

    def initialize(resp)
      @resp = to_hash_symbolize(resp)
      @status = resp.success?
    end

    def success?
      !!@status
    end

    def result
      sorting
    end

    def message
      @resp.dig(:message) || 'Failed to get cost'
    end

    private

    def sorting
      enum_codes = {
        gojek: nil,
        grab_express: nil,
        jne: nil,
        sicepat: nil,
        paxel: nil,
        anteraja: nil,
        deliveree: nil
      }

      @resp.dig(:results).each do |result|
        enum_codes[result.dig(:code).to_sym] = result
      end

      {
        query: {
          weight: @resp.dig(:query, :weight),
          courier: enum_codes.keys
        },
        results: enum_codes.values
      }
    end
  end
end