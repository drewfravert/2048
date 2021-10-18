defmodule GameWeb.GameLive do
  @moduledoc false

  use GameWeb, :live_view
  alias Game.Manager

  def mount(_params, _session, socket) do
    socket = assign(socket, game: Manager.current_game())

    {:ok, socket}
  end

  def render(assigns) do
    GameWeb.PageView.render("index.html", assigns)
  end
end
