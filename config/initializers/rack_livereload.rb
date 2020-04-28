# frozen_string_literal: true

Rails.application.configure do
  return unless Rails.env.development?

  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload
end
