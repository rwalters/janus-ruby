require './boot'
require 'rspec'
require 'rack/test'
require 'janus/server/api'

describe Janus::Server::API do
  include Rack::Test::Methods

  def app
    described_class
  end

  context 'GET /api/statuses' do
    before { get '/api/statuses' }

    context 'returns an array of hashes' do
      subject { JSON.parse(last_response.body) }

      it 'is a valid response' do
        expect(last_response.status).to eq(200)
      end

      it 'returns an array' do
        expect(subject).to be_kind_of(Array)
      end

      it 'the array contains hashes' do
        expect(subject.all?{|t| t.is_a?(Hash)}).to be_truthy
      end

      it 'the elements match the expected hash' do
        expect(subject[0]["id"]).to eq(1)
        expect(subject[0]["sent_at"]).to eq("2017-02-13T22:13:53Z")
        expect(subject[1]["id"]).to eq(2)
        expect(subject[1]["sent_at"]).to eq("2017-02-13T22:14:53Z")
      end
    end
  end

  context 'GET /api/statuses/random' do
    before { get '/api/statuses/random' }

    context 'returns a single hash' do
      subject { JSON.parse(last_response.body) }

      it 'is a valid response' do
        expect(last_response.status).to eq(200)
      end

      it 'returns an array' do
        expect(subject).to be_kind_of(Hash)
      end

      it 'the elements match the expected hash' do
        expect(subject["id"]).not_to be_nil
        expect(subject["sent_at"]).not_to be_nil
      end
    end
  end
end
