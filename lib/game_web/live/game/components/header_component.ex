defmodule HeaderComponent do
  @moduledoc false

  use Phoenix.LiveComponent

  def handle_event("new", _params, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    GameWeb.GameView.render("header.html", assigns)
  end
end
