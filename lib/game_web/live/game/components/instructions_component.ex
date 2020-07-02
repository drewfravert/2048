defmodule InstructionsComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    GameWeb.GameView.render("instructions.html", assigns)
  end
end
