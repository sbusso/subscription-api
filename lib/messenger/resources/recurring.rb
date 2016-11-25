module Messenger
  module Resources
    class Recurring < Base

      # Send message for specified recurring campaign
      # @param [Hash] options subscription parameters: email, etc.
      def send_message(recurring_id:, **options, &block)
        call(
          method: :post,
          path: "/campaigns/recurrings/#{recurring_id}/messages",
          data: options,
          &block
        )
      end

      # List of current recurring campaigns
      def list(&block)
        call(method: :get, path: "/campaigns/recurrings", &block)
      end
    end
  end
end
