# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_portal_session',
  :secret      => '92e44c6ad0a698254b4103c47da4a777531422cf6a2b4655d7e002c63304d9601df3a1197c8b070ac8269a7bd49ccebe382f8acc2e4e209260e7676884912c08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
