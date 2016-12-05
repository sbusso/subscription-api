module Messenger
  module Resources
    class Subscription < Base

      # List of site subscriptions
      def list(&block)
        call(method: :get, path: "/subscriptions", &block)
      end

      # Add member to site.
      # @param [Hash] options subscription parameters: email, etc.
      def create(**options, &block)
        call(
          method: :post,
          path: "/subscriptions",
          data: options,
          &block
        )
      end

      # Remove subscription from site.
      # @param [Hash] options subscription parameters: email, etc.
      def destroy(**options, &block)
        call(
          method: :delete,
          path: "/subscriptions",
          data: options,
          &block
        )
      end

      # Add tags to subscription
      # @param [String] email
      # @param [String] tags
      # @param [Hash] options: payload, etc
      def tag(**options, &block)
        call(
          method: :post,
          path: "/subscriptions/tag",
          data: options,
          &block
        )
      end

      # Add tags to subscription
      # @param [String] email
      # @param [String] tags
      # @param [Hash] options: payload, etc
      def untag(**options, &block)
        call(
          method: :post,
          path: "/subscriptions/untag",
          data: options,
          &block
        )
      end

      # Add external event for subscription
      # @param [String] email
      # @param [String] new_email
      def event(**options, &block)
        call(
          method: :post,
          path: "/subscriptions/event",
          data: options,
          &block
        )
      end

      # Update
      def update_email(**options, &block)
        call(
          method: :post,
          path: "/subscriptions/update_email",
          data: options,
          &block
        )
      end

    end
  end
end
