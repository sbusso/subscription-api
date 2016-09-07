module Messenger
  module Resources

    autoload :Channel, 'messenger/resources/channel'
    autoload :Subscription, 'messenger/resources/subscription'
    autoload :List, 'messenger/resources/list'

    class Base

      RESOURCES_LIST = [:channel, :subscription, :list]

      attr_reader :client

        def initialize(client:)
          @client = client
        end

        # API key
        # @return [String]
        def api_key
          client.api_key
        end

        # URL prefix for calling API methods.
        # @return [String]
        def url_prefix
          client.url_prefix
        end

        private
        # Call api via http.
        # @param [Symbol] method HTTP method.
        # @param [String] path Relative path for api method call.
        # @param [Hash] data Other options.
        # @return [Hash]
        def call(method:, path:, data:{}, &block)
          params = compose_params(method: method, path: path, data: data)
          execute_request(params, &block)
        end

        # Call api via http.
        # @param [Symbol] params RestClient::Request.execute params.
        # @return [Hash]
        def execute_request(params, &block)
          block ? block.call(restclient_exec(params), nil) : restclient_exec(params)
        rescue RestClient::Exception, JSON::ParserError => e
          block ? block.call(nil, {error: e.message}) : {error: e.message}
        end

        # RestClient request
        def restclient_exec(params)
          JSON.parse RestClient::Request.execute(params)
        end

        # Compose url
        # @param [String] path Relative path for api method call.
        # @return [String]
        def compose_api_url(path)
          "#{url_prefix}#{path}"
        end

        # Compose params for Restclient.
        # @param [Symbol] params RestClient::Request.execute params.
        # @return [Hash]
        def compose_params(method:, path:, data:{})
          {
            method: method,
            url: compose_api_url(path),
            payload: data,
            user: api_key
          }
        end
    end
  end
end
