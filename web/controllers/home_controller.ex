defmodule Cooking.HomeController do
  use Cooking.Web, :controller
  use Cooking.SessionHelpers

  plug :put_current_user
  plug :action

  def index(conn, _params) do
    conn
    |> render "index.html"
  end
end
