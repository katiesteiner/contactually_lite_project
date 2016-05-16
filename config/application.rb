require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'
require 'roo'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ContactuallyLite
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.factory_girl false
    end
  end
end
