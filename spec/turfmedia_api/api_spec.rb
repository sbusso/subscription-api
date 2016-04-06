require 'spec_helper'

describe ComcenterApi::API do

  let (:api_key) { "API key" }
  let (:url_prefix) { "http://site.com/api" }
  let(:client)  { ComcenterApi::Client.new(api_key: api_key, url_prefix: url_prefix) }
  let(:api) { ComcenterApi::API.new(client: client) }

  describe "initialize" do
    context "with credentials" do
      it "creates a api client with right credentials" do
        expect(api.api_key).to eq(client.api_key)
        expect(api.url_prefix).to eq(client.url_prefix)
      end
    end
  end

  describe "Api parametes" do
    context "url parameters" do
      it "concatenate url prefix with path" do
        path =  "/path"
        expect(api.send(:compose_api_url, path)).to eq(url_prefix + path)
      end
    end

    context "auth params" do
      it "adds auth parameters to request params" do
        params = api.send(:compose_params, {method: :post, path: url_prefix})
        expect(params[:user]).to eq(api_key)
      end
    end
  end



end
