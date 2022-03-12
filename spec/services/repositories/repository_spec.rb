# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repositories::Repository do
  let(:json) { File.read(Rails.root.join('spec', 'fixtures', 'repositories.json')) }

  before do
    allow_any_instance_of(described_class).to receive(:api_response).and_return(json)
  end

  subject { described_class.new }

  describe '#all' do
    it 'find returns all records' do
      records = subject.all
      expect(records.size).to eq 30
    end
  end
end
