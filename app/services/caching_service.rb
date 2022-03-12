# frozen_string_literal: true

module CachingService
  module_function

  EXPIRE = 5.minutes.to_i

  def set(params, response)
    redis.set(params[:q], response, ex: EXPIRE)
  end

  def get(params)
    redis.get(params[:q])
  end

  def redis
    Redis.current
  end
end
