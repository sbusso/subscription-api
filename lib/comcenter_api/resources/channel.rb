module ComcenterApi
  module Resources
    class Channel < Base

      # Channel index.
      def index
        call(method: :get, path: "/channels")
      end

    end
  end
end
