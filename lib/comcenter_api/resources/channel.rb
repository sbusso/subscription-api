module ComcenterApi
  module Resources
    class Channel < Base

      # Channel index.
      def index
        method = :get
        path = "/channels"
        call(method: method, path: path)
      end

    end
  end
end
