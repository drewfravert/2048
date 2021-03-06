defmodule Game.Coordinate do
  @moduledoc false

  alias __MODULE__
  alias Game.{Cell, Grid}

  @enforce_keys [:x, :y]

  defstruct [:x, :y]

  # ======================================================================================
  # Public
  # ======================================================================================

  def equal?(%Coordinate{} = coordinate_a, %Coordinate{} = coordinate_b) do
    coordinate_a === coordinate_b
  end

  def new(x, y) when is_integer(x) and is_integer(y) do
    %Coordinate{x: x, y: y}
  end

  def new(_x, _y) do
    {:error, :invalid_coordinate}
  end

  def random_empty(%Grid{} = grid) do
    %Cell{coordinate: coordinate} = Grid.list_empty_cells(grid) |> Enum.random()

    coordinate
  end

  def valid?(%Grid{columns: columns, rows: rows}, %Coordinate{x: x, y: y}) do
    x in rows and y in columns
  end
end
