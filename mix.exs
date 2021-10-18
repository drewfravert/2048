defmodule Game.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :game,
      version: "0.1.0",
      elixir: "1.12.2",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Game.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp aliases do
    [
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      setup: ["deps.get", "ecto.setup", "cmd yarn --cwd ./assets install", "phx.gen.cert"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.0.1", only: :dev},
      {:credo, "~> 1.5.6", only: [:dev, :test], runtime: false},
      {:ecto_sql, "~> 3.4"},
      {:floki, ">= 0.31.0", only: :test},
      {:gettext, "~> 0.18.2"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.5.10"},
      {:phoenix_ecto, "~> 4.4.0"},
      {:phoenix_html, "~> 2.14.3"},
      {:phoenix_live_view, "~> 0.15.7"},
      {:phoenix_live_reload, "~> 1.3.3", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4.0"},
      {:plug_cowboy, "~> 2.5.1"},
      {:postgrex, "~> 0.15"},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:telemetry_metrics, "~> 0.6.1"},
      {:telemetry_poller, "~> 0.5.1"},
      {:tzdata, "~> 1.1.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
