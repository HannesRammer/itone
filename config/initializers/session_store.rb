# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_training_session',
  :secret      => 'b2e4d0bcae4a87dd93abe3e93ca58e04788477789c3d9b76cfa92359d5d85b6611edf6eda2ea246a89868447ffdbbec5b1d3b416b58f7f7fdc5ff2bb7b75ed2e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
