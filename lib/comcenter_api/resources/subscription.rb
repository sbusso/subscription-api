module ComcenterApi
  module Resources
    class Subscription < Base

      # List of channel members
      def list(channel_id:)
        call(method: :get, path: "/channels/#{channel_id}/subscriptions")
      end

      # Add member to channel.
      # @param [Hash] options Channel parameters: email, etc.
      def create(**options)
        call(
          method: :post,
          path: "/channels/#{options.delete(:channel_id)}/subscriptions",
          data: options
        )
      end

      # Remove member from channel.
      # @param [Hash] options Channel parameters: email, etc.
      def destroy(**options)
        call(
          method: :delete,
          path: "/channels/#{options.delete(:channel_id)}/subscriptions",
          data: options
        )
      end

    end
  end
end
