use Mix.Config

config :game, GameWeb.Endpoint,
  url: [host: "ex2048.gigalixirapp.com", port: 443],
  force_ssl: true,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
