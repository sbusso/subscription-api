module Messenger
  module Resources
    class Subscription < Base

      # List of site members
      def list(site_id:, &block)
        call(method: :get, path: "/sites/#{site_id}/subscriptions", &block)
      end

      # Add member to site.
      # @param [Hash] options subscription parameters: email, etc.
      def create(site_id:, **options, &block)
        call(
          method: :post,
          path: "/sites/#{site_id}/subscriptions",
          data: options,
          &block
        )
      end

      # Remove subscription from site.
      # @param [Hash] options subscription parameters: email, etc.
      def destroy(site_id:, **options, &block)
        call(
          method: :delete,
          path: "/sites/#{site_id}/subscriptions",
          data: options,
          &block
        )
      end

      # Add tags to subscription
      # @param [Integer] site_id
      # @param [String] email
      # @param [String] tags
      # @param [Hash] options: payload, etc
      def tag(site_id:, **options, &block)
        call(
          method: :post,
          path: "/sites/#{site_id}/subscriptions/tag",
          data: options,
          &block
        )
      end

      # Add tags to subscription
      # @param [Integer] site_id
      # @param [String] email
      # @param [String] tags
      # @param [Hash] options: payload, etc
      def untag(site_id:, **options, &block)
        call(
          method: :post,
          path: "/sites/#{site_id}/subscriptions/untag",
          data: options,
          &block
        )
      end

      # Add external event for subscription
      # @param [Integer] site_id
      # @param [String] email
      # @param [String] event
      # @param [Hash] options: payload, etc
      def event(site_id:, **options, &block)
        call(
          method: :post,
          path: "/sites/#{site_id}/subscriptions/event",
          data: options,
          &block
        )
      end

    end
  end
end
