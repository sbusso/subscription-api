module Messenger
  module Resources
    class Confirmation < Base

      # List of confirmation campaigns
      def list(&block)
        call(method: :get, path: "/campaigns/confirmations", &block)
      end
    end
  end
end
