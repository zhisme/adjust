# frozen_string_literal: true

module Outbound
  module Errors
    class BadRequestError < StandardError; end
    class NotFoundError < BadRequestError; end
    class ApiError < BadRequestError; end
    class UnsupportedRequestTypeError < BadRequestError; end
    class UnprocessableRequest < ApiError; end

    def handle_errors(response) # rubocop:disable Metrics/MethodLength
      case response.status
      when 401, 403
        raise BadRequestError, 'Auth error'
      when 404
        raise NotFoundError, 'Not Found error'
      when 422
        raise UnprocessableRequest, 'API unprocessable'
      when 500
        raise ApiError, 'API error'
      else
        response.body
      end
    end
  end
end
