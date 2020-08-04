defmodule Game.MixProject do
  use Mix.Project

  def project do
    [
      app: :game,
      version: "0.1.0",
      elixir: "1.10.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # application configuration
  def application do
    [
      mod: {Game.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # compilation paths
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # project dependencies
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:floki, "~> 0.27", only: :test},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.5"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_dashboard, "~> 0.2"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.14"},
      {:plug_cowboy, "~> 2.3"},
      {:telemetry_metrics, "~> 0.5"},
      {:telemetry_poller, "~> 0.5"},
      {:tzdata, "~> 1.0.3"}
    ]
  end

  # mix aliases
  defp aliases do
    [
      setup: ["deps.get", "cmd yarn --cwd ./assets install"]
    ]
  end
end
