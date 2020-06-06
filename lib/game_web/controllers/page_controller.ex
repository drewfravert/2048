defmodule GameWeb.PageController do
  use GameWeb, :controller

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def game(conn, _params) do
    render(conn, "game.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def leaderboard(conn, _params) do
    render(conn, "leaderboard.html")
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end

  def watch(conn, _params) do
    render(conn, "watch.html")
  end
end
