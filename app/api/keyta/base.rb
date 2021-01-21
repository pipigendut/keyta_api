require 'grape'
require 'grape-swagger'
require 'grape-entity'

module Keyta
  class Base < Grape::API
    version 'v1', using: :path, vendor: 'keyta'
    format :json
    prefix :api
    rescue_from :all
    error_formatter :json, ErrorFormatter

    mount Keyta::V1::Expeditions

    add_swagger_documentation(
      base_path: '/',
      mount_path: '/swagger_doc.json',
      swagger: '2.0',
      info: {
        title: 'KEYTA API V1.',
        description: 'A Akbar of the API for Keyta',
        contact_name: 'Akbar Maulana',
        contact_email: 'akbar.maulana090895@gmail.com',
        contact_url: 'https://resumtakbar.xyz',
        license: 'The Akbar of the license'
      },
      markdown: false,
      hide_documentation_path: true,
      hide_format: true,
      included_base_url: true,
      api_version: 'v1'
    )
  end
end