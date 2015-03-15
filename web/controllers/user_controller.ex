defmodule Cooking.UserController do
  use Cooking.Web, :controller

  plug :action

  def new(conn, _params) do
    conn
    |> render "new.html"
  end

  def create(conn, params) do
  end
end
