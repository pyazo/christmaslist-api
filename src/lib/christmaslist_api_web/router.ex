defmodule ChristmaslistApiWeb.Router do
  use ChristmaslistApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChristmaslistApiWeb do
    pipe_through :browser # Use the default browser stack
  end

  # Other scopes may use custom stacks.
  scope "/api", ChristmaslistApiWeb do
    pipe_through :api

    get "/users", UserController, :list
    get "/users/:id", UserController, :getById

    get "/people", PersonController, :list
    get "/people/:id", PersonController, :getById
  end
end
