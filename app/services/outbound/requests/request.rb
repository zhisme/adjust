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
        def cached_response_body
          raise ImplementMe
        end

        def cache_response_body!
          raise ImplementMe
        end
      end
    end
  end
end
