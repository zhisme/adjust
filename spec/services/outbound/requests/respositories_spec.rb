# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Outbound::Requests::Repositories do
  subject { described_class.new({}) }

  {
    401 => Outbound::Errors::BadRequestError,
    403 => Outbound::Errors::BadRequestError,
    422 => Outbound::Errors::UnprocessableRequest,
    500 => Outbound::Errors::ApiError
  }.each do |status, expected_error|
    it "raises #{expected_error} if received status is #{status}" do
      allow(Faraday).to receive(:get).and_return(OpenStruct.new(status: status))
      expect { subject.call }.to raise_error expected_error
    end
  end

  let(:mocked_response) do
    double(:response, response: response, status: 200, body: '', env: env)
  end
  let(:env) { double(:env, response_body: '') }
  let(:response) { double(:response, status: 200) }

  it 'returns payload form request' do
    allow(Faraday).to receive(:get).and_return(mocked_response)
    expect(subject.call.response.status).to eq 200
  end
end
