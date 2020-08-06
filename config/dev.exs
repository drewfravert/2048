use Mix.Config

# Repo
config :game, Game.Repo,
  username: "postgres",
  password: "postgres",
  database: "game_development",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Endpoint
config :game, GameWeb.Endpoint,
  code_reloader: true,
  check_origin: false,
  debug_errors: true,
  http: [port: 4000],
  https: [
    port: 4001,
    cipher_suite: :strong,
    keyfile: "priv/cert/selfsigned_key.pem",
    certfile: "priv/cert/selfsigned.pem"
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/game_web/(live|views)/.*(ex)$",
      ~r"lib/game_web/templates/.*(eex)$"
    ]
  ],
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--config",
      "webpack.development.js",
      "--watch-stdin",
      "--color",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Logger
config :logger, :console, format: "[$level] $message\n"

# Phoenix
config :phoenix,
  plug_init_mode: :runtime,
  stacktrace_depth: 20
