require 'simplecov'
require "codeclimate-test-reporter"

if ENV["COVERAGE"]

  SimpleCov.start do
    add_filter "/config/"
    add_filter "/test/"
  end

  ENV['CODECLIMATE_REPO_TOKEN'] = ENV['CODECLIMATE_TRAVIS_PLAY']
  CodeClimate::TestReporter.start

 end


# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require "minitest/reporters"
Minitest::Reporters.use!

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new


# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end
