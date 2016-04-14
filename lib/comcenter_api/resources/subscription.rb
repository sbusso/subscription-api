module ComcenterApi
  module Resources
    class Subscription < Base

      # List of channel members
      def list(channel_id:, &block)
        call(method: :get, path: "/channels/#{channel_id}/subscriptions", &block)
      end

      # Add member to channel.
      # @param [Hash] options Channel parameters: email, etc.
      def create(**options, &block)
        call(
          method: :post,
          path: "/channels/#{options.delete(:channel_id)}/subscriptions",
          data: options,
          &block
        )
      end

      # Remove member from channel.
      # @param [Hash] options Channel parameters: email, etc.
      def destroy(**options, &block)
        call(
          method: :delete,
          path: "/channels/#{options.delete(:channel_id)}/subscriptions",
          data: options,
          &block
        )
      end

    end
  end
end
