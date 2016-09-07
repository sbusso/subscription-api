require 'spec_helper'

describe Messenger::Resources::Subscription do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { Messenger::Resources::Subscription.new(client: client) }

  describe "Api methods" do

      it "subscriptions list" do
        body_response = {subscriptions:[]}.to_json
        stub_request(:get, "http://api-key:@site.com/api/lists/1/subscriptions")
          .to_return(:body => body_response)
        expect(api.list(list_id: 1)).to include("subscriptions")
      end

      it "subscription create" do
        email = "email@example.com"
        stub_request(:post, "http://api-key:@site.com/api/lists/1/subscriptions")
          .with(body: {email: email})
          .to_return(:body => {email: email}.to_json)
        expect(api.create(list_id: 1, email: email).to_s).to include(email)
      end

      it "subscription destroy" do
        email = "email@example.com"
        stub_request(:delete, "http://api-key:@site.com/api/lists/1/subscriptions")
          .with(body: {email: email})
          .to_return(:body => {message: "unsubscribed"}.to_json)
        expect(api.destroy(list_id: 1, email: email).to_s).to include("unsubscribed")
      end

      it "subscription tag" do
        email = "email@example.com"
        tags = ["tag0"]
        stub_request(:post, "http://api-key:@site.com/api/lists/1/subscriptions/tag")
          .with(body: {email: email, tags: tags})
          .to_return(:body => {message: "Tag(s) was added to subscription"}.to_json)
        expect(api.tag(list_id: 1, email: email, tags: tags).to_s).to include("added")
      end

      it "subscription event" do
        email = "email@example.com"
        event = "payment"
        payload = {'price'=> '10'}
        stub_request(:post, "http://api-key:@site.com/api/lists/1/subscriptions/event")
          .with(body: {email: email, event: event, payload: payload})
          .to_return(:body => {message: "Event was added to subscription"}.to_json)
        expect(api.event(list_id: 1, email: email, event: event, payload: payload).to_s).to include("added")
      end

  end


end
