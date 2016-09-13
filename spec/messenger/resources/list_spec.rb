require 'spec_helper'

describe Messenger::Resources::List do

  let (:api_key) { "api-key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { Messenger::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { Messenger::Resources::List.new(client: client) }

  def compose_url(path)
    prefix = URI(url_prefix)
    "#{prefix.host}#{prefix.path}#{path}"
  end

  describe "Api methods" do
      it "lists index" do
        stub_request(:get, /.*#{compose_url("\/lists")}/).
        to_return(:body => {lists:[]}.to_json )
        expect(api.list).to include("lists")
      end
  end


end
