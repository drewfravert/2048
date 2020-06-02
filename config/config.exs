# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ex2048, Ex2048Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ij4ZjYsCsg/4MPPuOT6RS1VZ65SiVlz4/SDva69nJKzOqHbdqKWFvv7CKuj+31Au",
  render_errors: [view: Ex2048Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ex2048.PubSub,
  live_view: [signing_salt: "vvgSf5yZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
