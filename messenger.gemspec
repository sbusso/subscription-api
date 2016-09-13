$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "messenger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "messenger"
  s.version     = Messenger::VERSION
  s.authors     = ["Synesis"]
  s.email       = ["y.synesis@gmail.com"]
  s.homepage    = "http://"
  s.summary     = "Ruby wrapper for MessengerClient."
  s.description = "Ruby wrapper for MessengerClient."
  s.license     = ""

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
  s.add_runtime_dependency 'rest-client', '~> 1.8.0'
  s.add_runtime_dependency 'hashie',                         '>= 2.0'
  s.add_runtime_dependency 'multi_json',                     '>= 1.3'
  s.add_runtime_dependency 'activesupport'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.0'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'webmock'
end
