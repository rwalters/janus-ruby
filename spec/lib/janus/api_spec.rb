require 'rspec'
require 'rack/test'
require 'janus/api'

describe Janus::API do
  include Rack::Test::Methods

  def app
    Janus::API
  end

  context 'GET /api/statuses/public_timeline' do
    before { get '/api/statuses/public_timeline' }

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
        expect(subject.first["id"]).to eq(1)
        expect(subject.first["sent_at"]).to eq("2017-02-13T22:13:53Z")
        expect(subject[1]["id"]).to eq(2)
        expect(subject[1]["sent_at"]).to eq("2017-02-13T22:14:53Z")
      end
    end
  end
end
