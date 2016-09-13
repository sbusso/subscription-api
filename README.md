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
@api.subscriptions.list(list_id:1)

# Subscribe single member to list
@api.subscription.create(list_id: 1, member: {email: 'email@example.com', name: 'John Doe', city: 'New York', custom: {age: 39}})

# Subscribe multiple member to list
@api.subscription.create(list_id: 1, members: [{email: 'email@example.com', name: 'John Doe', city: 'New York', custom: {age: 39}}])
