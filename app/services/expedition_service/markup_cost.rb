require "#{Rails.root}/lib/api_service/expedition_api"

module ExpeditionService
  class MarkupCost
    include ExpeditionManage

    Result = Struct.new(:success?, :errors, :value, :meta)

    def initialize(args = {})
      @cost_params = args[:cost_params][:shipping_address]
    end

    def call
      cost = ExpeditionApi::Cost.new(
        cost_params: @cost_params
      ).call

      raise StandardError.new cost.message unless cost.success?
      
      Result.new(true, [], get_markup_expeditions(cost.result), nil)
    rescue StandardError => e
      Result.new(false, e, nil, nil)
    end
  end
end