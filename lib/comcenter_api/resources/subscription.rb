module ComcenterApi
  module Resources
    class Subscription < Base

      # List of list members
      def list(list_id:, &block)
        call(method: :get, path: "/lists/#{list_id}/subscriptions", &block)
      end

      # Add member to list.
      # @param [Hash] options List parameters: email, etc.
      def create(**options, &block)
        call(
          method: :post,
          path: "/lists/#{options.delete(:list_id)}/subscriptions",
          data: options,
          &block
        )
      end

      # Remove member from list.
      # @param [Hash] options List parameters: email, etc.
      def destroy(**options, &block)
        call(
          method: :delete,
          path: "/lists/#{options.delete(:list_id)}/subscriptions",
          data: options,
          &block
        )
      end

    end
  end
end
