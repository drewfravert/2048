# Load production configuration and secrets from environment variables
import Config

# configure endpoint
config :game, GameWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: nil, port: 443]
