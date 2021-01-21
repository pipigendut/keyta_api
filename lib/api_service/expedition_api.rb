require "#{Rails.root}/lib/rest_client"
require "#{Rails.root}/lib/api_service/expedition/cost"

module ExpeditionApi
  BASE_API = ENV['EXPEDITION_API_URL']
  BEARER_AUTH = ENV['EXPEDITION_BEARER_AUTH']
  HEADERS = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
end