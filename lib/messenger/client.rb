module Messenger
  # A class representing a connection to ComcenterApi. It holds the username and password.
  class Client

    include ApiAccessor
    use_resources Resources::Base::RESOURCES_LIST

    # Api key needed for authorized requests.
    # @return [String]
    attr_reader :api_key


    # URL prefix for calling API methods.
    # @return [String]
    attr_reader :url_prefix


    # A new API client.
    # @param [Hash] options API key, API url prefix.
    def initialize(api_key:, url_prefix:)
      @api_key = api_key
      @url_prefix = url_prefix
    end

    ###########################
    ## Subscriptions actions ##
    ###########################

    def all_subscriptions(&block)
      subscriptions.list(&block)
    end

    def subscribe(options, &block)
      subscriptions.create(options, &block)
    end

    def unsubscribe(options, &block)
      subscriptions.destroy(options, &block)
    end

    def untag_subscription(options, &block)
      subscriptions.untag(options, &block)
    end

    def tag_subscription(options, &block)
      subscriptions.tag(options, &block)
    end

    def event_subscription(options, &block)
      subscriptions.event(options, &block)
    end

    def update_subscription_email(options, &block)
      subscriptions.update_email(options, &block)
    end

    ###########################
    ###### Sites actions ######
    ###########################

    def all_sites(&block)
      sites.list(&block)
    end
  end

end
