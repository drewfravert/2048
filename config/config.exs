use Mix.Config

# Repo
config :game,
  ecto_repos: [Game.Repo]

# Endpoint
config :game, GameWeb.Endpoint,
  live_view: [signing_salt: "vvgSf5yZ"],
  pubsub_server: Game.PubSub,
  render_errors: [view: GameWeb.ErrorView, accepts: ~w(html json), layout: false],
  secret_key_base: "Ij4ZjYsCsg/4MPPuOT6RS1VZ65SiVlz4/SDva69nJKzOqHbdqKWFvv7CKuj+31Au",
  url: [host: "game.local"]

# Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Elixir
config :elixir,
  time_zone_database: Tzdata.TimeZoneDatabase

# Phoenix
config :phoenix,
  json_library: Jason

# Environment
import_config "#{Mix.env()}.exs"
