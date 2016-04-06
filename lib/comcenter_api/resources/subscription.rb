module ComcenterApi
  module Resources
    class Subscription < Base

      # List of channel members
      def index(channel_id)
        call(method: :get, path: "/channels/#{channel_id}/subscriptions")
      end

      # Add member to channel.
      # @param [Hash] options Channel parameters: email, etc.
      def create(channel_id, **options)
        call(
          method: :post,
          path: "/channels/#{channel_id}/subscriptions",
          data: options
        )
      end

      # Remove member from channel.
      # @param [Hash] options Channel parameters: email, etc.
      def destroy(channel_id, **options)
        call(
          method: :delete,
          path: "/channels/#{channel_id}/subscriptions",
          data: options
        )
      end

    end
  end
end
