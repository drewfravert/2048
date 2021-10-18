defmodule Game.Manager do
  @moduledoc false

  use GenServer
  alias Game.Actuator

  @directions [:up, :down, :left, :right]
  @points Enum.map(1..20, &(:math.pow(2, &1) |> round()))

  # ======================================================================================
  # Client
  # ======================================================================================

  def current_game() do
    GenServer.call(__MODULE__, :current_game)
  end

  def game_over?() do
    GenServer.call(__MODULE__, :game_over?)
  end

  def game_over!() do
    GenServer.cast(__MODULE__, :game_over!)
  end

  def game_won?(merged_tile_value) do
    GenServer.call(__MODULE__, {:game_won?, merged_tile_value})
  end

  def game_won!() do
    GenServer.cast(__MODULE__, :game_won!)
  end

  def increase_score(points) when points in @points do
    GenServer.cast(__MODULE__, {:increase_score, points})
  end

  def move(direction) when direction in @directions do
    GenServer.cast(__MODULE__, {:move, direction})
  end

  def new_game() do
    GenServer.cast(__MODULE__, :new_game)
  end

  def start_link(game) do
    GenServer.start_link(__MODULE__, game, name: __MODULE__)
  end

  # ======================================================================================
  # Server
  # ======================================================================================

  @impl true
  def init(_) do
    game = Game.new()

    {:ok, game}
  end

  @impl true
  def handle_call(:current_game, _from, game) do
    {:reply, game, game}
  end

  @impl true
  def handle_call(:game_over?, _from, game) do
    game_over? = not is_nil(game.finished)

    {:reply, game_over?, game}
  end

  @impl true
  def handle_call({:game_won?, merged_tile_value}, _from, game) do
    game_won? = merged_tile_value === 2048

    {:reply, game_won?, game}
  end

  @impl true
  def handle_cast(:game_over!, game) do
    game = %Game{game | finished: DateTime.now!("Etc/UTC")}

    {:noreply, game}
  end

  @impl true
  def handle_cast(:game_won!, game) do
    {:noreply, game}
  end

  @impl true
  def handle_cast({:increase_score, points}, %Game{score: score, tile: tile} = game) do
    score = score + points
    tile = if points > tile, do: points, else: tile
    game = %Game{game | score: score, tile: tile}

    {:noreply, game}
  end

  @impl true
  def handle_cast({:move, direction}, %Game{grid: grid} = game) do
    grid = grid |> Actuator.move(direction)
    game = %Game{game | grid: grid}

    {:noreply, game}
  end

  @impl true
  def handle_cast(:new_game, _game) do
    game = Game.new()

    {:noreply, game}
  end
end
