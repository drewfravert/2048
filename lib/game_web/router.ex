defmodule GameWeb.Router do
  use GameWeb, :router

  # ======================================================================================
  # Pipelines
  # ======================================================================================

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_root_layout, {GameWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  # ======================================================================================
  # Scopes
  # ======================================================================================

  scope "/", GameWeb do
    pipe_through :browser

    live "/", GameLive

    get "/about", PageController, :about
    get "/game/:id", PageController, :game
    get "/leaderboard", PageController, :leaderboard
    get "/privacy", PageController, :privacy
    get "/watch", PageController, :watch
  end

  # scope "/api", GameWeb do
  #   pipe_through :api
  # end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: GameWeb.Telemetry
    end
  end
end
