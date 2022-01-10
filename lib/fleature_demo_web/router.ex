defmodule FleatureDemoWeb.Router do
  use FleatureDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {FleatureDemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FleatureDemoWeb do
    pipe_through :browser

    live "/", HomeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", FleatureDemoWeb do
  #   pipe_through :api
  # end
end
