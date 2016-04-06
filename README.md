## Installation

``` ruby
# Gemfile
gem 'comcenter_api', :git => 'https://github.com/sbusso/subscription-api.git'
```

## Using

### Call methods

``` ruby
# Creating client
@api = ComcenterApi::Client.new(api_key: 'your-api-key', url_prefix: 'http://api-url.etc').api

# and call methods
@api.channel_index
