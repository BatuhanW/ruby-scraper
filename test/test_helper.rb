ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'

module ActiveSupport
  class TestCase
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
