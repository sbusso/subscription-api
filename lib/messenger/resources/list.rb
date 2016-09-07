module Messenger
  module Resources
    class List < Base

      # Lists index.
      def list(&block)
        call(method: :get, path: "/lists", &block)
      end

    end
  end
end
