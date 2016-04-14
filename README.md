## Installation

``` ruby
# Gemfile
gem 'comcenter_api', github: 'sbusso/subscription-api'
```

## Using

### Call methods

``` ruby
# Creating client
@api = ComcenterApi::Client.new(api_key: 'your-api-key', url_prefix: 'http://api-url.etc')

# show channels
@api.channels.list

# show subscribers for channel 1
@api.subscriptions.list(channel_id:1)
