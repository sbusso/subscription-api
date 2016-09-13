module Messenger
  require 'forwardable'
  require 'yaml'
  require 'hashie'
  require 'rest-client'
  require 'active_support/inflector'

  require 'messenger/api_accessor'
  require 'messenger/resources/base'
  require 'messenger/client'
end
