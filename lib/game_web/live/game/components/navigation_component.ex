defmodule NavigationComponent do
  @moduledoc false

  use Phoenix.LiveComponent

  def render(assigns) do
    GameWeb.LayoutView.render("navigation.html", assigns)
  end
end
