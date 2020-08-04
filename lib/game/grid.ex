defmodule Game.Grid do
  alias __MODULE__
  alias Game.{Cell, Coordinate, Tile}

  @enforce_keys [:cells, :columns, :rows, :tiles]
  @columns 1..4
  @rows 1..4
  @vectors %{
    up: %{x: 0, y: -1},
    down: %{x: 0, y: 1},
    left: %{x: -1, y: 0},
    right: %{x: 1, y: 0}
  }

  defstruct [:cells, :columns, :rows, :tiles]

  # ======================================================================================
  # Public
  # ======================================================================================

  def contains_combinable_cells?(%Grid{cells: cells} = grid) do
    Enum.any?(cells, fn
      %Cell{coordinate: %Coordinate{x: x, y: y}, tile: %Tile{value: value}} ->
        Enum.any?(@vectors, fn {_direction, vector} ->
          adjacent_coordinate = Coordinate.new(x + vector.x, y + vector.y)
          adjacent_tile = Tile.at_coordinate(grid, adjacent_coordinate)

          adjacent_tile && adjacent_tile.value === value
        end)

      _ ->
        false
    end)
  end

  def contains_empty_cells?(%Grid{} = grid) do
    grid
    |> list_empty_cells()
    |> Enum.any?()
  end

  def farthest_empty_cell(%Grid{} = grid, %Cell{coordinate: coordinate} = cell, direction) do
    next_coordinate =
      Coordinate.new(coordinate.x + @vectors[direction].x, coordinate.y + @vectors[direction].y)

    next_cell = Cell.at_coordinate(grid, next_coordinate)
    obstruction? = is_nil(next_cell) or not is_nil(next_cell.tile)

    case obstruction? do
      false -> farthest_empty_cell(grid, next_cell, direction)
      true -> %{farthest: cell, next: next_cell}
    end
  end

  def list_empty_cells(%Grid{cells: cells}) do
    cells |> Enum.filter(&is_nil(&1.tile))
  end

  def list_occupied_cells(%Grid{cells: cells}) do
    cells |> Enum.reject(&is_nil(&1.tile))
  end

  def moves_available?(grid) do
    contains_empty_cells?(grid) or contains_combinable_cells?(grid)
  end

  def new() do
    cells =
      for row <- @rows, column <- @columns do
        Coordinate.new(column, row) |> Cell.new()
      end

    %Grid{cells: cells, columns: @columns, rows: @rows, tiles: %{}}
  end

  def output(%Grid{cells: cells, columns: columns, rows: rows} = grid) do
    x_max = Enum.max(columns)
    y_max = Enum.max(rows)
    occupied_cells = Grid.list_occupied_cells(grid)

    Enum.each(cells, fn %Cell{coordinate: %Coordinate{x: x, y: y}} = cell ->
      cell_match =
        Enum.find(occupied_cells, fn %Cell{tile: tile} ->
          tile.coordinate === cell.coordinate and not Tile.dismissed?(tile)
        end)

      value = (cell_match && cell_match.tile && cell_match.tile.value) || "."

      cond do
        x === x_max and y === y_max ->
          IO.write("#{value}\nScore: 0\n")

        x === x_max ->
          IO.write("#{value}\n")

        true ->
          IO.write("#{value} ")
      end
    end)

    grid
  end
end
