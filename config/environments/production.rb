# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Action mailer required for devise
config.action_mailer.default_url_options = { :host => '127.0.0.1:3000' }
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp
	# config.time_zone = 'UTC'

  config.action_mailer.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :domain => 'baobabhealth.org',
  :authentication => :plain,
  :user_name => "dde_admin",
  :password => "admin_admin"
   }
# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false
config.log_level=:info
