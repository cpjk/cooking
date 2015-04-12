defmodule Cooking.SessionController do
  use Cooking.Web, :controller

  alias Cooking.User
  alias Cooking.Repo

  plug :action

  def new(conn, _params) do
    conn
    |> render "new.html"
  end

  def create(conn, params) do
    case User.login(params["session"]) do
      user = %User{} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:notice, "You have been logged in successfully.")
      false ->
        conn
        |> put_flash(:notice, "Email/password combination is incorrect.")
    end
    |> redirect to: home_path(conn, :index)
  end

  def delete(conn, _params) do
    conn
    |> put_session(:user_id, nil)
    |> redirect to: home_path(conn, :index)
  end
end
