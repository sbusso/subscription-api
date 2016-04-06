module ComcenterApi
  module Resources
    class Subscription < Base

      # List of channel members
      def index(channel_id)
        method = :get
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path)
      end

      # Add member to channel.
      # @param [Hash] options Channel parameters: email, etc.
      def create(channel_id, **options)
        method = :post
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path, data: options)
      end

      # Remove member from channel.
      # @param [Hash] options Channel parameters: email, etc.
      def destroy(channel_id, **options)
        method = :delete
        path = "/channels/#{channel_id}/subscriptions"
        call(method: method, path: path, data: options)
      end

    end
  end
end
