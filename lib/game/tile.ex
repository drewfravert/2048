defmodule Game.Tile do
  @moduledoc """
  """

  # ======================================================================================
  # Configuration
  # ======================================================================================

  alias __MODULE__
  alias Game.{Cell, Coordinate, Grid, Tile}

  # ======================================================================================
  # Schema
  # ======================================================================================

  @enforce_keys [:id, :coordinate, :origin, :state, :value]

  defstruct [:id, :coordinate, :origin, :state, :value]

  # ======================================================================================
  # Public Functions
  # ======================================================================================

  @doc """
  """
  def activate!(%Tile{} = tile) do
    %Tile{tile | state: :activated}
  end

  @doc """
  """
  def activated?(%Tile{state: state}) do
    state === :activated
  end

  @doc """
  """
  def dismiss!(%Tile{} = tile) do
    %Tile{tile | state: :dismissed}
  end

  @doc """
  """
  def dismissed?(%Tile{state: state}) do
    state === :dismissed
  end

  @doc """
  """
  def merge!(%Tile{} = tile) do
    %Tile{tile | state: :merged, value: tile.value * 2}
  end

  @doc """
  """
  def merged?(%Tile{state: state}) do
    state === :merged
  end

  @doc """
  """
  def move!(%Tile{coordinate: origin} = tile, %Coordinate{} = coordinate) do
    %Tile{tile | coordinate: coordinate, origin: origin, state: :moved}
  end

  @doc """
  """
  def moved?(%Tile{state: state}) do
    state === :moved
  end

  @doc """
  """
  def spawn!(%Coordinate{} = coordinate) do
    %Tile{
      coordinate: coordinate,
      id: random_id(),
      origin: nil,
      state: :spawned,
      value: random_value()
    }
  end

  @doc """
  """
  def spawned?(%Tile{state: state}) do
    state === :spawned
  end

  @doc """
  """
  def at_coordinate(%Grid{} = grid, %Coordinate{} = coordinate) do
    %Cell{tile: tile} = Cell.at_coordinate(grid, coordinate)

    tile
  end

  # ======================================================================================
  # Private Functions
  # ======================================================================================

  defp random_id() do
    make_ref()
    |> inspect()
    |> String.replace(["#", ".", "<", ">"], "")
    |> String.replace("Reference", "T")
    |> String.to_atom()
  end

  defp random_value() do
    if Enum.random(1..10) === 10, do: 4, else: 2
  end
end
