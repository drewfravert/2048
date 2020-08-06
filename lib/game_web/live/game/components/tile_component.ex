defmodule TileComponent do
  @moduledoc false

  use Phoenix.LiveComponent

  def render(assigns) do
    GameWeb.GameView.render("tile.html", assigns)
  end
end
