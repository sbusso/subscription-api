require 'spec_helper'

describe ComcenterApi::Resources::Channel do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { ComcenterApi::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { ComcenterApi::Resources::Channel.new(client: client) }

  def compose_url(path)
    prefix = URI(url_prefix)
    "#{prefix.host}#{prefix.path}#{path}"
  end

  describe "Api methods" do
      it "channel index" do
        path =  "/channels"
        body_response = {channels:[]}.to_json
        stub_request(:get, /.*#{compose_url(path)}/).to_return(:body => body_response)
        expect(api.index).to include("channels")
      end
  end


end
