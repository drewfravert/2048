defmodule Game do
  @moduledoc false

  alias Game.{Actuator, Grid}

  @enforce_keys [:finished, :grid, :id, :score, :started, :tile]

  defstruct [:finished, :grid, :id, :score, :started, :tile]

  # ======================================================================================
  # Public
  # ======================================================================================

  def new() do
    %Game{
      finished: nil,
      grid:
        Grid.new()
        |> Actuator.spawn_tile()
        |> Actuator.spawn_tile(),
      id: random_id(),
      score: 0,
      started: DateTime.now!("Etc/UTC"),
      tile: 2
    }
  end

  def new(%Game{} = state) do
    state
  end

  # ======================================================================================
  # Private
  # ======================================================================================

  defp random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["Reference", "#", ".", "<", ">"], "")
  end
end
