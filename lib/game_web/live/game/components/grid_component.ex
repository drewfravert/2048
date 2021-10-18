defmodule GridComponent do
  @moduledoc false

  use Phoenix.LiveComponent
  alias Game.Manager

  def handle_event("move", %{"key" => "ArrowUp"}, socket) do
    Manager.move(:up)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowDown"}, socket) do
    Manager.move(:down)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowLeft"}, socket) do
    Manager.move(:left)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowRight"}, socket) do
    Manager.move(:right)

    {:noreply, socket}
  end

  def handle_event("move", _params, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    GameWeb.GameView.render("grid.html", assigns)
  end
end
