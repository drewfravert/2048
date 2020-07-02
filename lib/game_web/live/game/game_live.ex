defmodule GameWeb.GameLive do
  use GameWeb, :live_view

  # ======================================================================================
  # Mount Handler
  # ======================================================================================

  def mount(_params, _session, socket) do
    case connected?(socket) do
      true ->
        socket = assign(socket, game: Game.new())

        {:ok, socket}

      false ->
        socket = assign(socket, game: Game.new())

        {:ok, socket}
    end
  end

  # ======================================================================================
  # Render Handler
  # ======================================================================================

  def render(assigns) do
    GameWeb.PageView.render("index.html", assigns)
  end
end
