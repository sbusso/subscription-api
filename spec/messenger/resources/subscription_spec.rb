require 'spec_helper'

describe Messenger::Resources::Subscription do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { Messenger::Resources::Subscription.new(client: client) }

  describe "Api methods" do

      it "subscriptions list" do
        body_response = {subscriptions:[]}.to_json
        stub_request(:get, "http://api-key:@site.com/api/subscriptions")
          .to_return(:body => body_response)
        expect(api.list).to include("subscriptions")
      end

      it "single subscription creation" do
        email = "email@example.com"
        stub_request(:post, "http://api-key:@site.com/api/subscriptions")
          .with(body: {email: email, tag: 'tag0'})
          .to_return(:body => {message: "subscribed"}.to_json)
        expect(api.create(email: email, tag: 'tag0').to_s).to include('subscribed')
      end

      it "multiple subscription creation" do
        email1 = "email@example.com"
        email2 = "email2@example.com"
        members = [{email: email1, tag: 'tag0'}, {email: email2, tag: 'tag0'}]
        stub_request(:post, "http://api-key:@site.com/api/subscriptions")
          .with(body: {members: members})
          .to_return(:body => {message: "subscribed"}.to_json)
        expect(api.create(members: members).to_s).to include('subscribed')
      end

      it "single subscription deletation" do
        email = "email@example.com"
        stub_request(:delete, "http://api-key:@site.com/api/subscriptions")
          .with(body: {email: email, tag: 'tag0'})
          .to_return(:body => {message: "unsubscribed"}.to_json)
        expect(api.destroy({email: email, tag: 'tag0'}).to_s).to include("unsubscribed")
      end

      it "multiple subscription deletation" do
        email1 = "email@example.com"
        email2 = "email2@example.com"
        members = [{email: email1, tag: 'tag0'}, {email: email2, tag: 'tag0'}]
        stub_request(:delete, "http://api-key:@site.com/api/subscriptions")
          .with(body: {members: members})
          .to_return(:body => {message: "unsubscribed"}.to_json)
        expect(api.destroy(members: members).to_s).to include("unsubscribed")
      end

      it "subscription tag" do
        email = "email@example.com"
        tags = ["tag0", "tag1"]
        stub_request(:post, "http://api-key:@site.com/api/subscriptions/tag")
          .with(body: {email: email, tags: tags})
          .to_return(:body => {message: "Tag(s) was added to subscription"}.to_json)
        expect(api.tag(email: email, tags: tags).to_s).to include("added")
      end

      it "subscription untag" do
        email = "email@example.com"
        tags = ["tag0", "tag1"]
        stub_request(:post, "http://api-key:@site.com/api/subscriptions/untag")
          .with(body: {email: email, tags: tags})
          .to_return(:body => {message: "Tag(s) was removed from subscription"}.to_json)
        expect(api.untag(email: email, tags: tags).to_s).to include("removed")
      end

      it "add event to subscriber" do
        email = "email@example.com"
        event = "payment"
        payload = {'price'=> '10'}
        stub_request(:post, "http://api-key:@site.com/api/subscriptions/event")
          .with(body: {email: email, event: event, payload: payload})
          .to_return(:body => {message: "Event was added to subscription"}.to_json)
        expect(api.event(email: email, event: event, payload: payload).to_s).to include("added")
      end

      it "updates subscription's email" do
        email = "email@example.com"
        new_email = "new_email@example.com"
        stub_request(:post, "http://api-key:@site.com/api/subscriptions/update_email")
          .with(body: {email: email, new_email: new_email})
          .to_return(:body => {message: "Subscription's email was changed"}.to_json)
        expect(api.update_email(email: email, new_email: new_email).to_s).to include("changed")
      end

  end


end
