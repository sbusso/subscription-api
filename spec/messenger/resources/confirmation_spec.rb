require 'spec_helper'

describe Messenger::Resources::Confirmation do

  let(:api_key) { "api-key" }
  let(:confirmation_id) { 'uuid' }
  let(:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { described_class.new(client: client) }

  describe "Api methods" do
    it "confirmations campaigns list" do
      body_response = [].to_json
      stub_request(:get, "http://api-key:@site.com/api/campaigns/confirmations")
        .to_return(:body => body_response)
      expect(api.list).to eq([])
    end
  end

end
