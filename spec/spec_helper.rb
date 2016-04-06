require 'comcenter_api'
require 'pry'
require 'awesome_print'
require 'webmock/rspec'
require 'uri'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.color = true
end

RSpec::Matchers.define :log_requests do
  match do |logger|
    logger.log_requests?
  end
end

RSpec::Matchers.define :log_errors do
  match do |logger|
    logger.log_errors?
  end
end

RSpec::Matchers.define :log_responses do
  match do |logger|
    logger.log_responses?
  end
end
