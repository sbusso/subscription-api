require 'spec_helper'

describe Messenger::Resources::Channel do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { Messenger::Resources::Channel.new(client: client) }

  def compose_url(path)
    prefix = URI(url_prefix)
    "#{prefix.host}#{prefix.path}#{path}"
  end

  describe "Api methods" do
      it "channels index" do
        stub_request(:get, /.*#{compose_url("\/channels")}/).
        to_return(:body => {channels:[]}.to_json )
        expect(api.list).to include("channels")
      end
  end


end
