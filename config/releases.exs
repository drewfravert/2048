import Config

# Repo
database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

# configure database
config :game, Game.Repo,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  url: database_url

# Endpoint
config :game, GameWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  server: true,
  url: [host: nil, port: 443]
