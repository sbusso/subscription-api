module ComcenterApi

  class API

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

      # Channel index.
      def channel_index
        method = :get
        path = "/channels"
        call(method: method, path: path)
      end

      # Show channel.
      # @param [integer] id User id.
      def channel_show(id)
        method = :get
        path = "/channels/#{id}"
        call(method: method, path: path)
      end

      # Create channel.
      # @param [Hash] options Channel parameters: name etc.
      def channel_create(options)
        method = :post
        path = "/channels"
        call(method: method, path: path, data: options)
      end

      # Update channel.
      # @param [integer] id Channel id.
      # @param [Hash] options Channel parameters: id, name, etc.
      def channel_update(id, options)
        method = :put
        path = "/channels/#{id}"
        call(method: method, path: path, data: options)
      end

      # Destroy channel.
      # @param [integer] id Channel id.
      def channel_destroy(id)
        method = :delete
        path = "/channels/#{id}"
        call(method: method, path: path)
      end

      # List of channel members
      def subscription_index(channel_id)
        method = :get
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path)
      end

      # Add member to channel.
      # @param [Hash] options Channel parameters: email, etc.
      def subscription_create(channel_id, **options)
        method = :post
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path, data: options)
      end

      # Remove member from channel.
      # @param [Hash] options Channel parameters: email, etc.
      def subscription_destroy(channel_id, **options)
        method = :delete
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path, data: options)
      end

      private
      # Call api via http.
      # @param [Symbol] method HTTP method.
      # @param [String] path Relative path for api method call.
      # @param [Hash] data Other options.
      # @return [Hash]
      def call(method:, path:, data:{})
        params = compose_params(method: method, path: path, data: data)
        execute_request(params)
      end

      private

      # Call api via http.
      # @param [Symbol] params RestClient::Request.execute params.
      # @return [Hash]
      def execute_request(params)
        JSON.parse(RestClient::Request.execute params)
      rescue JSON::ParserError => e
        {error: e.message}
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
