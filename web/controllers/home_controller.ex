defmodule Cooking.HomeController do
  use Cooking.Web, :controller
  use Cooking.SessionHelpers

  plug :action

  def index(conn, _params) do
    render conn, "index.html", current_user: current_user(conn)
  end

end
