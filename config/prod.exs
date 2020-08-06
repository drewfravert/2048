use Mix.Config

# Endpoint
config :game, GameWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  force_ssl: true,
  url: [host: "ex2048.gigalixirapp.com", port: 443]

# Logger
config :logger, level: :info
