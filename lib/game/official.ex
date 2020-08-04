defmodule Game.Official do
  def increase_score(%Game{score: score} = game, points) do
    %Game{game | score: score + points}
  end

  def get_status(%Game{} = game) do
    game.status
  end

  def update_status(%Game{} = game, status) do
    %Game{game | status: status}
  end
end
