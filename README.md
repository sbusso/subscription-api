## Installation

``` ruby
# Gemfile
gem 'messenger', github: 'turfmedia/messenger-client'
```

## Using

### Call methods

``` ruby
# Creating client
@api = Messenger::Client.new(api_key: 'your-api-key', url_prefix: 'http://api-url.etc')

# show subscribers for channel 1
@api.all_subscriptions

# Subscribe single member to list
@api.subscribe(email: 'email@example.com', name: 'John Doe', city: 'New York',tags: ['list-name'], custom: {age: 39})

# Unsubscribe single member to list
@api.unsubscribe(email: 'email@example.com', name: 'John Doe', city: 'New York',tags: ['list-name'], custom: {age: 39})

# Subscribe multiple member to list
@api.subscribe(members: [{email: 'email@example.com', name: 'John Doe', city: 'New York', custom: {age: 39}}])

# Unsubscribe multiple member to list
@api.subscribe(members: [{email: 'email@example.com'}])

# Adds tags to subscription
@api.tag_subscription(email: 'email@example.com', tags: ['list-name'])

# Removes tags to subscription
@api.untag_subscription.untag(email: 'email@example.com', tags: ['list-name'])
