# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CachingService do
  let(:json) { File.read(Rails.root.join('spec', 'fixtures', 'repositories.json')) }

  describe '.set' do
    subject { described_class.set(params, json) }

    let(:params) { { q: 'helloworld' } }

    it 'caches response for request params' do
      is_expected.to eq('OK')
    end
  end

  describe '.get' do
    subject { described_class.get(params) }

    let(:params) { { q: 'helloworld' } }

    before { described_class.set(params, json) }

    it 'returns cached response by request params' do
      is_expected.to eq(json)
    end
  end
end
