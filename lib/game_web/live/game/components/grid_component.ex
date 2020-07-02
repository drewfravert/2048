defmodule GridComponent do
  use Phoenix.LiveComponent

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias Game.Actuator

  # ======================================================================================
  # Render Handler
  # ======================================================================================

  def render(assigns) do
    GameWeb.GameView.render("grid.html", assigns)
  end

  # ======================================================================================
  # Event Handlers
  # ======================================================================================

  def handle_event("move", %{"key" => "ArrowUp"}, socket) do
    socket =
      update(socket, :game, fn %Game{grid: grid} = game ->
        grid = grid |> Actuator.move(:up)

        %Game{game | grid: grid}
      end)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowDown"}, socket) do
    socket =
      update(socket, :game, fn %Game{grid: grid} = game ->
        grid = grid |> Actuator.move(:down)

        %Game{game | grid: grid}
      end)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowLeft"}, socket) do
    socket =
      update(socket, :game, fn %Game{grid: grid} = game ->
        grid = grid |> Actuator.move(:left)

        %Game{game | grid: grid}
      end)

    {:noreply, socket}
  end

  def handle_event("move", %{"key" => "ArrowRight"}, socket) do
    socket =
      update(socket, :game, fn %Game{grid: grid} = game ->
        grid = grid |> Actuator.move(:right)

        %Game{game | grid: grid}
      end)

    {:noreply, socket}
  end

  def handle_event("move", _params, socket) do
    {:noreply, socket}
  end
end
