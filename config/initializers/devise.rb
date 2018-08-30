# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  # config.omniauth :facebook, "App ID", "App Secret", callback_url: "http://localhost:3000/users/auth/facebook/callback"

  # config.omniauth :google_oauth2, "232819209990-utn23bbgvjip0hfbedge3s8f84kkjuv3.apps.googleusercontent.com", "EslGuUwX6hVSepxtz5qgJ63a", { }

  # Add the credentials from your Google application to your secrets
  client_id = Rails.application.secrets["232819209990-utn23bbgvjip0hfbedge3s8f84kkjuv3.apps.googleusercontent.com"]
  client_secret = Rails.application.secrets["EslGuUwX6hVSepxtz5qgJ63a"]
  # Configure Google omniauth with proper scope
  config.omniauth :google_oauth2, client_id, client_secret, {
    scope: "contacts.readonly,userinfo.email"
  }
end
