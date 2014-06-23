# Specifies gem version of Rails to use when vendor/rails is not present

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.frameworks -= [ :action_web_service, :action_mailer, :active_resource ]
	config.log_level = :debug
	config.action_controller.session_store = nil
	config.active_record.schema_format = :sql

	config.gem 'actionmailer'

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  
	config.gem 'warden'
	config.gem 'devise'
	config.gem 'will_paginate', :version => '~> 2.3.16'  
	
end

require 'has_many_through_association_extension'




