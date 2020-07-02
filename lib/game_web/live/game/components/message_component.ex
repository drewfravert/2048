defmodule MessageComponent do
  use Phoenix.LiveComponent

  # ======================================================================================
  # Mount Handler
  # ======================================================================================

  def mount(socket) do
    assigns = [
      message: "Join the numbers and get to the 2048 tile!"
    ]

    socket = assign(socket, assigns)

    {:ok, socket}
  end

  # ======================================================================================
  # Render Handler
  # ======================================================================================

  def render(assigns) do
    GameWeb.GameView.render("message.html", assigns)
  end
end
