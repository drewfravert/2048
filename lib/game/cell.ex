defmodule Game.Cell do
  alias __MODULE__
  alias Game.{Coordinate, Grid, Tile}

  @enforce_keys [:coordinate, :tile]

  defstruct [:coordinate, :tile]

  # ======================================================================================
  # Public
  # ======================================================================================

  def at_coordinate(%Grid{cells: cells}, %Coordinate{} = target_coordinate) do
    Enum.find(cells, &(&1.coordinate === target_coordinate))
  end

  def new(coordinate, tile \\ nil)

  def new(%Coordinate{} = coordinate, %Tile{} = tile) do
    %Cell{coordinate: coordinate, tile: tile}
  end

  def new(%Coordinate{} = coordinate, nil = tile) do
    %Cell{coordinate: coordinate, tile: tile}
  end

  def new(_coordinate, _tile) do
    {:error, :invalid_cell}
  end
end
