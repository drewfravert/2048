defmodule Game.Actuator do
  @moduledoc false

  alias Game.{Cell, Coordinate, Grid, Manager, Tile}

  # ======================================================================================
  # Public
  # ======================================================================================

  def move(%Grid{} = grid, direction) do
    case Manager.game_over?() do
      true ->
        grid

      false ->
        grid
        |> prepare()
        |> traverse(direction)
    end
  end

  def move(_direction), do: {:error, :move, :invalid_move}

  def spawn_tile(%Grid{} = grid) do
    tile = Coordinate.random_empty(grid) |> Tile.spawn!()

    grid
    |> put_tile_in_cell(tile)
    |> update_tiles(tile)
  end

  # ======================================================================================
  # Private
  # ======================================================================================

  defp build_traversals(%Grid{columns: columns, rows: rows}, direction) do
    columns = if direction === :right, do: Enum.reverse(columns), else: Enum.to_list(columns)
    rows = if direction === :down, do: Enum.reverse(rows), else: Enum.to_list(rows)

    cond do
      direction in [:up, :down] -> for y <- rows, x <- columns, do: %{x: x, y: y}
      direction in [:left, :right] -> for x <- columns, y <- rows, do: %{x: x, y: y}
      true -> {:error, :build_traversals, :invalid_direction}
    end
  end

  defp check_movement(%Grid{cells: cells} = grid) do
    movement? =
      Enum.any?(cells, fn
        %Cell{tile: %Tile{} = tile} -> Tile.moved?(tile) or Tile.merged?(tile)
        _ -> false
      end)

    case movement? do
      true -> spawn_tile(grid)
      false -> grid
    end
  end

  defp check_status(%Grid{} = grid) do
    unless Grid.moves_available?(grid), do: Manager.game_over!()

    grid
  end

  defp delete_tile_in_cell(%Grid{cells: cells} = grid, %Tile{id: id}) do
    cells =
      Enum.map(cells, fn
        %Cell{tile: %Tile{id: ^id}} = cell -> %Cell{cell | tile: nil}
        cell -> cell
      end)

    %Grid{grid | cells: cells}
  end

  defp dismiss_tile(%Grid{} = grid, %Tile{} = tile) do
    grid
    |> delete_tile_in_cell(tile)
    |> update_tiles(tile)
  end

  defp merge_tile(%Grid{} = grid, %Tile{} = tile) do
    grid
    |> put_tile_in_cell(tile)
    |> update_tiles(tile)
  end

  defp move_tile(%Grid{} = grid, %Tile{} = tile) do
    grid
    |> delete_tile_in_cell(tile)
    |> put_tile_in_cell(tile)
    |> update_tiles(tile)
  end

  defp perform_traversals(%Grid{} = grid, traversals, direction) do
    [traversal | traversals] = traversals
    coordinate = Coordinate.new(traversal.x, traversal.y)
    cell = Cell.at_coordinate(grid, coordinate)

    grid =
      case cell do
        %Cell{tile: %Tile{} = tile} ->
          %{farthest: farthest_cell, next: next_cell} = Grid.farthest_empty_cell(grid, cell, direction)

          combinable? =
            next_cell && next_cell.tile && next_cell.tile.value === tile.value && not Tile.merged?(next_cell.tile)

          if combinable? do
            %Cell{coordinate: next_coordinate, tile: next_tile} = next_cell

            dismissed_tile = tile |> Tile.move!(next_coordinate) |> Tile.dismiss!()
            merged_tile = next_tile |> Tile.merge!()

            Manager.increase_score(merged_tile.value)

            grid
            |> dismiss_tile(dismissed_tile)
            |> merge_tile(merged_tile)
          else
            %Cell{coordinate: farthest_coordinate} = farthest_cell

            moved_tile =
              case not Coordinate.equal?(coordinate, farthest_coordinate) do
                true -> tile |> Tile.move!(farthest_coordinate)
                false -> tile
              end

            grid
            |> move_tile(moved_tile)
          end

        _ ->
          grid
      end

    case length(traversals) > 0 do
      true -> perform_traversals(grid, traversals, direction)
      false -> grid
    end
  end

  defp prepare(%Grid{cells: cells, tiles: tiles} = grid) do
    cells =
      cells
      |> Enum.map(fn
        %Cell{tile: %Tile{} = tile} = cell -> %Cell{cell | tile: Tile.activate!(tile)}
        cell -> cell
      end)

    tiles =
      tiles
      |> Stream.reject(fn {id, tile} -> {id, Tile.dismissed?(tile)} end)
      |> Stream.map(fn {id, tile} -> {id, Tile.activate!(tile)} end)
      |> Map.new()

    %Grid{grid | cells: cells, tiles: tiles}
  end

  defp put_tile_in_cell(%Grid{cells: cells} = grid, %Tile{coordinate: coordinate} = tile) do
    cells =
      Enum.map(cells, fn
        %Cell{coordinate: ^coordinate} = cell -> %Cell{cell | tile: tile}
        cell -> cell
      end)

    %Grid{grid | cells: cells}
  end

  defp traverse(%Grid{} = grid, direction) do
    traversals = build_traversals(grid, direction)

    grid
    |> perform_traversals(traversals, direction)
    |> check_movement()
    |> check_status()
  end

  defp update_tiles(%Grid{tiles: tiles} = grid, %Tile{id: id} = tile) do
    tiles = tiles |> Map.put(id, tile)

    %Grid{grid | tiles: tiles}
  end
end
