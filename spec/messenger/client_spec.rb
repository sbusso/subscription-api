require 'spec_helper'

describe Messenger::Client do

  let (:api_key) { "API key" }
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
    it "use channel resource" do
      expect(client.channels).to be_an_instance_of(Messenger::Resources::Channel)
    end

    it "use subscription resource" do
      expect(client.subscriptions).to be_an_instance_of(Messenger::Resources::Subscription)
    end

    it "use list resource" do
      expect(client.lists).to be_an_instance_of(Messenger::Resources::List)
    end
  end

end
