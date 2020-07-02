defmodule Game do
  @moduledoc """
  """

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias Game.{Actuator, Grid, Player}

  # ======================================================================================
  # Attributes
  # ======================================================================================

  @enforce_keys [:finished, :grid, :id, :player, :score, :started, :status, :tile]

  # ======================================================================================
  # Schema
  # ======================================================================================

  defstruct [:finished, :grid, :id, :player, :score, :started, :status, :tile]

  # ======================================================================================
  # Public Functions
  # ======================================================================================

  def new() do
    %Game{
      finished: nil,
      grid:
        Grid.new()
        |> Actuator.spawn_tile()
        |> Actuator.spawn_tile(),
      id: random_id(),
      player: Player.new(),
      score: 0,
      started: DateTime.now!("Etc/UTC"),
      status: :initialized,
      tile: 2
    }
  end

  def new(%Game{} = state) do
    state
  end

  # ======================================================================================
  # Private Functions
  # ======================================================================================

  defp random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["#", ".", "<", ">"], "")
    |> String.replace("Reference", "G")
    |> String.to_atom()
  end
end
