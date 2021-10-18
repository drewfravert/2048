defmodule Game.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Game.Repo,
      GameWeb.Telemetry,
      {Phoenix.PubSub, name: Game.PubSub},
      GameWeb.Endpoint,
      Game.Manager
    ]

    opts = [name: Game.Supervisor, strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GameWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
