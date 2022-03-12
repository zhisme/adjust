# frozen_string_literal: true

require 'rails_helper'

shared_examples 'http successful response' do
  it 'returns success http request' do
    is_expected.to eq(200)
  end
end

RSpec.describe RepositoriesController, type: :request do
  let(:json) { File.read(Rails.root.join('spec', 'fixtures', 'repositories.json')) }

  before do
    allow_any_instance_of(Repositories::Repository).to receive(:api_response).and_return(json)
  end

  describe 'GET /' do
    subject { get repositories_path, params: params }

    context 'when no params' do
      let(:params) { {} }

      it_behaves_like 'http successful response'
    end

    context 'when params with query' do
      let(:params) { { q: 'helloworld' } }

      it_behaves_like 'http successful response'
    end
  end
end
