require "#{Rails.root}/lib/api_service/expedition_api"

module ExpeditionService
  class SpecificCost
    include ExpeditionManage

    Result = Struct.new(:success?, :errors, :value, :meta)

    def initialize(args = {})
      @cost_params = args[:cost_params]
      @shipping_address = @cost_params[:shipping_address]
      @expeditions = @cost_params[:expeditions]
    end

    def call
      cost = ExpeditionApi::Cost.new(
        cost_params: @shipping_address
      ).call

      raise StandardError.new cost.message unless cost.success?
      
      Result.new(true, [], get_specific_expidition(cost.result, @expeditions), nil)
    rescue StandardError => e
      Result.new(false, e, nil, nil)
    end

    private


  end
end