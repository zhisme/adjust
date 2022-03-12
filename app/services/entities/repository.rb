# frozen_string_literal: true

module Entities
  class Repository < Dry::Struct
    module Types
      include Dry.Types()
    end

    attribute :id,        Types::Integer
    attribute :name,      Types::String
    attribute :full_name, Types::String
    attribute :url,       Types::String

    def self.wrap_entity(item)
      new(
        id: item['id'],
        name: item['name'],
        full_name: item['full_name'],
        url: item['url']
      )
    end
  end
end
