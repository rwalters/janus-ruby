require 'spec_helper_client'

describe Janus::Client::Status do
  let(:json_statuses) do
    [{ id: 1, sent_at: "2017-02-13T22:14:53Z" }, { id: 2, sent_at: "2017-03-14T22:14:53Z" }]
  end
  let(:find_id)   { json_statuses.first[:id] }
  let(:create_id) { 8 }


  describe ".all" do
    before do
      stub_api_for(described_class) do |stub|
        stub.get("/api/statuses") do |env|
          [200, {}, json_statuses.to_json]
        end

        stub.get("/api/statuses/#{find_id}") do |env|
          [200, {}, json_statuses.first.to_json]
        end
      end
    end

    Given(:statuses) { described_class.all }

    Then { statuses.length == 2 }
    Then { statuses.errors.length == 0 }
  end

  describe ".find" do
    before do
      stub_api_for(described_class) do |stub|
        stub.get("/api/statuses/#{find_id}") do |env|
          [200, {}, json_statuses.first.to_json]
        end
      end
    end
    Given(:status) { described_class.find(1) }

    Then { status.class == Janus::Client::Status }
    And  { status.id == 1 }
    And  { status.sent_at == json_statuses.first[:sent_at] }
  end
end
