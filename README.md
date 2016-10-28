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

# show sites
@api.channels.list

# show subscribers for channel 1
@api.subscriptions.list(site_id:1)

# Subscribe single member to list
@api.subscription.create(site_id: 1, member: {email: 'email@example.com', name: 'John Doe', city: 'New York',tags: ['list-name'], custom: {age: 39}})

# Subscribe multiple member to list
@api.subscription.create(list_id: 1, members: [{email: 'email@example.com', name: 'John Doe', city: 'New York', custom: {age: 39}}])

# Adds tags to subscription
@api.subscription.tag(site_id: 1, email: 'email@example.com', tags: ['list-name'])

# Removes tags to subscription
@api.subscription.untag(site_id: 1, email: 'email@example.com', tags: ['list-name'])
