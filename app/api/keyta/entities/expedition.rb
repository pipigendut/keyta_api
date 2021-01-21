module Keyta
  module Entities
    module Expedition
      class ExpeditionEntity < Grape::Entity
        expose :query, documentation: { type: 'Hash' }
        expose :results
      end
    end
  end
end
