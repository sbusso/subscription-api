module Messenger
  module Resources
    class Site < Base

      # Lists index.
      def list(&block)
        call(method: :get, path: "/sites", &block)
      end

    end
  end
end
