require 'spec_helper'

describe ComcenterApi::Resources::Subscription do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { ComcenterApi::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { ComcenterApi::Resources::Subscription.new(client: client) }

  def compose_url(path)
    prefix = URI(url_prefix)
    "#{prefix.host}#{prefix.path}#{path}"
  end

  describe "Api methods" do

      it "subscriptions list" do
        body_response = {subscriptions:[]}.to_json
        stub_request(:get, /.*#{compose_url("\/lists\/1\/subscriptions")}/).to_return(:body => body_response)
        expect(api.list(list_id: 1)).to include("subscriptions")
      end

      it "subscription create" do
        email = "email@example.com"
        stub_request(:post, /.*#{compose_url("\/lists\/1\/subscriptions")}/).
        with(body: {email: email}).
        to_return(:body => {email: email}.to_json)
        expect(api.create(list_id: 1, email: email).to_s).to include(email)
      end

      it "subscription destroy" do
        email = "email@example.com"
        stub_request(:delete, /.*#{compose_url("\/lists\/1\/subscriptions")}/).
        with(body: {email: email}).
        to_return(:body => {message: "unsubscribed"}.to_json)
        expect(api.destroy(list_id: 1, email: email).to_s).to include("unsubscribed")
      end

  end


end
