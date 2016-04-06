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

      it "subscription index" do
        path =  "/channels/1/subscriptions"
        body_response = {subscriptions:[]}.to_json
        stub_request(:get, /.*#{compose_url(path)}/).to_return(:body => body_response)
        expect(api.index(1)).to include("subscriptions")
      end

      it "subscription create" do
        path =  "/channels/1/subscriptions"
        email = "email@example.com"
        body_response = {email: email}.to_json
        stub_request(:post, /.*#{compose_url(path)}/).
        with(body: {email: email}).
        to_return(:body => body_response)
        expect(api.create(1, email: email).to_s).to include(email)
      end

      it "subscription destroy" do
        path =  "/channels/1/subscriptions"
        email = "email@example.com"
        body_response = {message: "unsubscribed"}.to_json
        stub_request(:delete, /.*#{compose_url(path)}/).
        with(body: {email: email}).
        to_return(:body => body_response)
        expect(api.destroy(1, email: email).to_s).to include("unsubscribed")
      end

  end


end
