defmodule Game do
  @moduledoc """
  """

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias Game.{Grid, Player}

  # ======================================================================================
  # Attributes
  # ======================================================================================

  @enforce_keys [:finished, :grid, :id, :player, :score, :started, :state]

  @states [:initialized, :playing, :won, :continue, :lost]

  # ======================================================================================
  # Schema
  # ======================================================================================

  defstruct [:finished, :grid, :id, :player, :score, :started, :state]

  # ======================================================================================
  # Public Functions
  # ======================================================================================

  def new() do
    %Game{
      finished: nil,
      grid: Grid.new(),
      id: random_id(),
      player: Player.new("Drew"),
      score: 0,
      started: DateTime.now!("Etc/UTC"),
      state: :initialized
    }
  end

  def new(%Game{} = state) do
    state
  end

  # ======================================================================================
  # Private Functions
  # ======================================================================================

  def random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["#", ".", "<", ">", "Reference"], "")
    |> String.to_atom()
  end
end
