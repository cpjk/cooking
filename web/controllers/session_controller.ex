defmodule Cooking.SessionController do
  use Cooking.Web, :controller

  alias Cooking.User
  alias Cooking.Repo

  import Elixir.IEx

  plug :action

  def new(conn, _params) do
    conn
    |> render "new.html"
  end

  def create(conn, params) do
    case try_login(params["session"]) do
      true ->
        put_flash(conn, :notice, "You have been logged in successfully.")
      false ->
        put_flash(conn, :notice, "Email/password combination is incorrect.")
    end
    |> redirect to: Cooking.Router.Helpers.user_path(Endpoint, :index)
  end

  def delete(conn, _params) do
  end

  defp try_login(%{"email" => email, "password" => password}) do
    user_with_email = Repo.one(User.by_email(email))

    case user_with_email do
      %User{hashed_password: hashed_password} ->
        Comeonin.Bcrypt.checkpw(password, hashed_password)
      _ ->
        Comeonin.Bcrypt.dummy_checkpw
    end
  end

  defp try_login(%{}) do
    Comeonin.Bcrypt.dummy_checkpw
  end

end
