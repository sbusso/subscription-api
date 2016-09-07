module Messenger
  module Resources
    class Channel < Base

      # Channel index.
      def list(&block)
        call(method: :get, path: "/channels", &block)
      end

    end
  end
end
