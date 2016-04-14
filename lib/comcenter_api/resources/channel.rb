module ComcenterApi
  module Resources
    class Channel < Base

      # Channel index.
      def list
        call(method: :get, path: "/channels")
      end

    end
  end
end
