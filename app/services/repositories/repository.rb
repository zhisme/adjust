# frozen_string_literal: true

module Repositories
  class Repository
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def all
      create_entities
    end

    private

    def fetch
      parse(api_response)
    end

    def api_response
      all_api_getway.call.body
    end

    def all_api_getway
      ::Outbound::Requests::Repositories.new(params)
    end

    def parse(json)
      JSON.parse(json)['items']
    end

    def create_entities
      fetch.map do |item|
        create_repository(item)
      end
    end

    def create_repository(item)
      return if item.blank?

      Entities::Repository.wrap_entity(
        item
      )
    end
  end
end
