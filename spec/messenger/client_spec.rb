require 'spec_helper'

describe Messenger::Client do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }

  describe "initialize" do
    context "without arguments" do
      it "dosen't create a client without api key" do
        expect{ Messenger::Client.new(url_prefix: url_prefix) }.to raise_error(ArgumentError)
      end

      it "dosen't create a client without url prefix" do
        expect{ Messenger::Client.new(api_key: api_key) }.to raise_error(ArgumentError)
      end
    end

    context "with arguments" do
      it "create a client with api key and url prefix" do
        expect(client).to be_an_instance_of(Messenger::Client)
      end
    end
  end

  describe "use api resources" do
    it "use subscription resource" do
      expect(client.subscriptions).to be_an_instance_of(Messenger::Resources::Subscription)
    end

    it "use site resource" do
      expect(client.sites).to be_an_instance_of(Messenger::Resources::Site)
    end
  end

  context 'subscriptions' do
    let (:api_key) { "api-key" }
    let (:url_prefix) { "http://site.com/api" }
    let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
    let(:api) { Messenger::Resources::Subscription.new(client: client) }

    it '#all_subscriptions' do
      body_response = {subscriptions:[]}.to_json
      stub_request(:get, "http://api-key:@site.com/api/subscriptions")
        .to_return(:body => body_response)
      expect(client.all_subscriptions).to include("subscriptions")
    end
    
    it "#subscribe" do
      email = "email@example.com"
      stub_request(:post, "http://api-key:@site.com/api/subscriptions")
        .with(body: {email: email, tag: 'tag0'})
        .to_return(:body => {message: "subscribed"}.to_json)
      expect(client.subscribe(email: email, tag: 'tag0').to_s).to include('subscribed')
    end
  
    it "#unsubscribe" do
      email = "email@example.com"
      stub_request(:delete, "http://api-key:@site.com/api/subscriptions")
        .with(body: {email: email, tag: 'tag0'})
        .to_return(:body => {message: "unsubscribed"}.to_json)
      expect(client.unsubscribe(email: email, tag: 'tag0').to_s).to include("unsubscribed")
    end
    
    
    it "#tag_subscription" do
      email = "email@example.com"
      tags = ["tag0", "tag1"]
      stub_request(:post, "http://api-key:@site.com/api/subscriptions/tag")
        .with(body: {email: email, tags: tags})
        .to_return(:body => {message: "Tag(s) was added to subscription"}.to_json)
      expect(client.tag_subscription(email: email, tags: tags).to_s).to include("added")
    end

    it "#untag_subscription" do
      email = "email@example.com"
      tags = ["tag0", "tag1"]
      stub_request(:post, "http://api-key:@site.com/api/subscriptions/untag")
        .with(body: {email: email, tags: tags})
        .to_return(:body => {message: "Tag(s) was removed from subscription"}.to_json)
      expect(client.untag_subscription(email: email, tags: tags).to_s).to include("removed")
    end

    it " #event_subscription" do
      email = "email@example.com"
      event = "payment"
      payload = {'price'=> '10'}
      stub_request(:post, "http://api-key:@site.com/api/subscriptions/event")
        .with(body: {email: email, event: event, payload: payload})
        .to_return(:body => {message: "Event was added to subscription"}.to_json)
      expect(client.event_subscription(email: email, event: event, payload: payload).to_s).to include("added")
    end

    it "#update_subscription_email" do
      email = "email@example.com"
      new_email = "new_email@example.com"
      stub_request(:post, "http://api-key:@site.com/api/subscriptions/update_email")
        .with(body: {email: email, new_email: new_email})
        .to_return(:body => {message: "Subscription's email was changed"}.to_json)
      expect(client.update_subscription_email(email: email, new_email: new_email).to_s).to include("changed")
    end
  end

  context 'sites' do
    let(:api_key) { "api-key" }
    let(:url_prefix) { "http://site.com/api" }
    let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
    let(:api) { Messenger::Resources::Site.new(client: client) }

    def compose_url(path)
      prefix = URI(url_prefix)
      "#{prefix.host}#{prefix.path}#{path}"
    end

    it "#all_sites" do
      stub_request(:get, /.*#{compose_url("\/sites")}/).
      to_return(:body => {sites:[]}.to_json )
      expect(client.all_sites).to include("sites")
    end
  end

  context 'recurring' do
    let(:api_key) { "api-key" }
    let(:recurring_id) { 'uuid' }
    let(:url_prefix) { "http://site.com/api" }
    let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
    let(:api) { described_class.new(client: client) }

    it "#all_recurrings" do
      body_response = [].to_json
      stub_request(:get, "http://api-key:@site.com/api/campaigns/recurrings")
        .to_return(:body => body_response)
      expect(client.all_recurrings).to eq([])
    end
    
    it "#send_recurring_message" do
      stub_request(:post, "http://api-key:@site.com/api/campaigns/recurrings/#{recurring_id}/messages")
        .with(body: {subject: 'subject', body: 'body'})
        .to_return(:body => {message: "Message sent"}.to_json)
      expect(client.send_recurring_message(recurring_id: recurring_id, subject: 'subject', body: 'body').to_s).to include('Message sent')
    end
  end



end
