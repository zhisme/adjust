# frozen_string_literal: true

module Outbound
  module Requests
    module Request
      def self.included(base)
        base.class_eval do
          include ResponseMethods
          include Caching

          attr_accessor :response
        end
      end

      module ResponseMethods
        def response_successful?
          @response.success?
        end
      end

      module Caching
        def cached_response
          OpenStruct.new(body: CachingService.get(params))
        end

        def cache_exist?
          CachingService.get(params).present?
        end

        def cache_response!
          CachingService.set(params, response.env.response_body)
        end
      end
    end
  end
end
