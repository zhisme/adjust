# frozen_string_literal: true

require_relative '../client'
require_relative 'request'

module Outbound
  module Requests
    class Repositories
      include Request

      REQUEST_TYPE = :get
      API_URL = 'https://api.github.com'

      attr_reader :params

      def initialize(params)
        @client = Outbound::Client.new
        @response = nil
        @params = params
      end

      def call
        if cache_exist?
          cached_response
        else
          options = { request_type: REQUEST_TYPE, url: url }
          @response = @client.call(options)
          cache_response!
          response
        end
      end

      private

      def url
        "#{API_URL}/search/repositories?q=#{params[:q]}"
      end
    end
  end
end
