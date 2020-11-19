require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KnowledgeApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
      view_specs:false,
      helper_specs:false,
      routing_specs:false
      g.factory_bot dir: 'spec/factories'
    end

    config.time_zone = 'Tokyo'
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locals', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # config.autoload_paths += %W(#{Rails.root}/app/controllers/lib)
    # config.eager_load_paths += %W(#{Rails.root}/app/controllers/lib)

    config.paths.add '/app/controllers/lib', eager_load: true
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.hosts << '.example.com'
    config.hosts << 'knwldg.xyz'
    config.hosts << 'localhost'
  end
end
