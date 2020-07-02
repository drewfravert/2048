defmodule HeaderComponent do
  use Phoenix.LiveComponent

  # ======================================================================================
  # Render Handler
  # ======================================================================================

  def render(assigns) do
    GameWeb.GameView.render("header.html", assigns)
  end

  # ======================================================================================
  # Event Handlers
  # ======================================================================================

  def handle_event("new", _params, socket) do
    {:noreply, socket}
  end
end
