ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'

if ENV['CI']
  require 'simplecov'
  require 'coveralls'

  SimpleCov.start('rails')

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include AuthHelper
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
