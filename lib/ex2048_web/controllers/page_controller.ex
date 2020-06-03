defmodule Ex2048Web.PageController do
  use Ex2048Web, :controller

  def game(conn, _params) do
    render(conn, "game.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def leaderboard(conn, _params) do
    render(conn, "leaderboard.html")
  end
end
