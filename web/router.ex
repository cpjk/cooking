defmodule Cooking.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Cooking do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index

    resources "users", UserController

    resource "session", SessionController, only: [:new, :create, :delete]
  end
end
