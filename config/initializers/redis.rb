# frozen_string_literal: true

Redis.current = Redis::Namespace.new('adjust', redis: Redis.new)
