require "simplecov"
SimpleCov.start "rails"

# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "spec_helper"
require "rspec/rails"
require "govuk_sidekiq/testing"
require "sidekiq_unique_jobs/testing"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true

  config.before :suite do
    Rails.application.load_seed
  end

  config.infer_spec_type_from_file_location!
end
