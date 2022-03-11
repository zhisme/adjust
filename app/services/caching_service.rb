# frozen_string_literal: true

module CachingService
  module_function

  EXPIRE = 5.minutes.to_i

  def set(params, response)
    Redis.current.set(params[:q], response, ex: EXPIRE)
  end

  def get(params)
    Redis.current.get(params[:q])
  end
end
