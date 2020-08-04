defmodule Game.Tile do
  alias __MODULE__
  alias Game.{Cell, Coordinate, Grid, Tile}

  @enforce_keys [:id, :coordinate, :origin, :state, :value]

  defstruct [:id, :coordinate, :origin, :state, :value]

  # ======================================================================================
  # Public
  # ======================================================================================

  def activate!(%Tile{} = tile) do
    %Tile{tile | state: :activated}
  end

  def activated?(%Tile{state: state}) do
    state === :activated
  end

  def dismiss!(%Tile{} = tile) do
    %Tile{tile | state: :dismissed}
  end

  def dismissed?(%Tile{state: state}) do
    state === :dismissed
  end

  def merge!(%Tile{} = tile) do
    %Tile{tile | state: :merged, value: tile.value * 2}
  end

  def merged?(%Tile{state: state}) do
    state === :merged
  end

  def move!(%Tile{coordinate: origin} = tile, %Coordinate{} = coordinate) do
    %Tile{tile | coordinate: coordinate, origin: origin, state: :moved}
  end

  def moved?(%Tile{state: state}) do
    state === :moved
  end

  def spawn!(%Coordinate{} = coordinate) do
    %Tile{
      coordinate: coordinate,
      id: random_id(),
      origin: nil,
      state: :spawned,
      value: random_value()
    }
  end

  def spawned?(%Tile{state: state}) do
    state === :spawned
  end

  def at_coordinate(%Grid{} = grid, %Coordinate{} = coordinate) do
    %Cell{tile: tile} = Cell.at_coordinate(grid, coordinate)

    tile
  end

  # ======================================================================================
  # Private
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
