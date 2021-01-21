module Keyta
  module V1
    class Expeditions < Keyta::Base
      resources :expeditions, only: :index do
        desc 'Return all costs.', {
          success: Entities::Expedition::ExpeditionEntity,
          consumes: ['application/json'],
          produces: ['application/json']
        }
        params do
          optional :check_cost_params, type: Hash, documentation: { param_type: 'body' } do
            optional :shipping_address, type: Hash do
              optional :dest_address, type: String, default: 'Jl. Anyelir, RT.9/RW.1, Jatipulo, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :dest_lat, type: String, default: '-6.1779499'
              optional :dest_lng, type: String, default: '106.8010439'
              optional :dest_postal_code, type: String, default: '11430'
              optional :src_address, type: String, default: 'Keyta (PT Kita Teknologi Andalan), Jalan Kamboja, RT.4/RW.7, Kota Bambu Utara, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :src_lat, type: String, default: '-6.1816664'
              optional :src_lng, type: String, default: '106.802901'
              optional :src_postal_code, type: String, default: '11420'
              optional :weight, type: Integer, default: 1
            end
          end
        end
        post :check_cost do
          result = ExpeditionService::CheckCost.new(
            cost_params: params[:check_cost_params]
          ).call
          raise result.errors unless result.success?

          Entities::Expedition::ExpeditionEntity.represent(result.value).as_json
        end

        desc 'Return all costs within markup.', {
          success: Entities::Expedition::ExpeditionEntity,
          consumes: ['application/json'],
          produces: ['application/json']
        }
        params do
          optional :check_cost_params, type: Hash, documentation: { param_type: 'body' } do
            optional :shipping_address, type: Hash do
              optional :dest_address, type: String, default: 'Jl. Anyelir, RT.9/RW.1, Jatipulo, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :dest_lat, type: String, default: '-6.1779499'
              optional :dest_lng, type: String, default: '106.8010439'
              optional :dest_postal_code, type: String, default: '11430'
              optional :src_address, type: String, default: 'Keyta (PT Kita Teknologi Andalan), Jalan Kamboja, RT.4/RW.7, Kota Bambu Utara, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :src_lat, type: String, default: '-6.1816664'
              optional :src_lng, type: String, default: '106.802901'
              optional :src_postal_code, type: String, default: '11420'
              optional :weight, type: Integer, default: 1
            end
          end
        end
        post :markup_cost do
          result = ExpeditionService::MarkupCost.new(
            cost_params: params[:check_cost_params]
          ).call
          raise result.errors unless result.success?

          Entities::Expedition::ExpeditionEntity.represent(result.value).as_json
        end

        desc 'Return specific costs within markup.', {
          success: Entities::Expedition::ExpeditionEntity,
          consumes: ['application/json'],
          produces: ['application/json']
        }
        params do
          optional :specific_cost_params, type: Hash, documentation: { param_type: 'body' } do
            optional :shipping_address, type: Hash do
              optional :dest_address, type: String, default: 'Jl. Anyelir, RT.9/RW.1, Jatipulo, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :dest_lat, type: String, default: '-6.1779499'
              optional :dest_lng, type: String, default: '106.8010439'
              optional :dest_postal_code, type: String, default: '11430'
              optional :src_address, type: String, default: 'Keyta (PT Kita Teknologi Andalan), Jalan Kamboja, RT.4/RW.7, Kota Bambu Utara, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia'
              optional :src_lat, type: String, default: '-6.1816664'
              optional :src_lng, type: String, default: '106.802901'
              optional :src_postal_code, type: String, default: '11420'
              optional :weight, type: Integer, default: 1
            end
            optional :expeditions, default: ['grab_express', 'deliveree', 'paxel']
          end
        end
        post :specific_cost do
          result = ExpeditionService::SpecificCost.new(
            cost_params: params[:specific_cost_params]
          ).call
          raise result.errors unless result.success?

          Entities::Expedition::ExpeditionEntity.represent(result.value).as_json
        end
      end
    end
  end
end