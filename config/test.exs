use Mix.Config

# Repo
config :game, Game.Repo,
  username: "postgres",
  password: "postgres",
  database: "game_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Endpoint
config :game, GameWeb.Endpoint,
  http: [port: 4002],
  server: false

# Logger
config :logger, level: :warn
