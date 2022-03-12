# frozen_string_literal: true

require 'rails_helper'

describe Entities::Repository do
  it 'create valid entity' do
    entity = described_class.new(id: 1, full_name: 'full_name', name: 'name', url: '/url')
    expect(entity.id).to eq 1
  end

  describe '.wrap_entity' do
    { id: 1, full_name: 'full_name', name: 'name', url: '/url' }.each do |attr, value|
      it "creates valid entity with expected #{attr} = #{value}" do
        params = { 'id' => 1, 'full_name' => 'full_name', 'name' => 'name', 'url' => '/url' }
        entity = described_class.wrap_entity(params)

        expect(entity[attr]).to eq(value)
      end
    end
  end
end
