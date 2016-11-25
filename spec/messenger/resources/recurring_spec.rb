require 'spec_helper'

describe Messenger::Resources::Recurring do

  let(:api_key) { "api-key" }
  let(:recurring_id) { 'uuid' }
  let(:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { described_class.new(client: client) }

  describe "Api methods" do
    it "recurrings campaigns list" do
      body_response = [].to_json
      stub_request(:get, "http://api-key:@site.com/api/campaigns/recurrings")
        .to_return(:body => body_response)
      expect(api.list).to eq([])
    end
    
    it "single message create" do
      stub_request(:post, "http://api-key:@site.com/api/campaigns/recurrings/#{recurring_id}/messages")
        .with(body: {subject: 'subject', body: 'body'})
        .to_return(:body => {message: "Message sent"}.to_json)
      expect(api.send_message(recurring_id: recurring_id, subject: 'subject', body: 'body').to_s).to include('Message sent')
    end
  end

end
