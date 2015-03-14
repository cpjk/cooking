defmodule Cooking.PageController do
  use Cooking.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
