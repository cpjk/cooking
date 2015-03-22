defmodule Cooking.UserController do
  use Cooking.Web, :controller

  alias Cooking.User

  plug :action

  def index(conn, _params) do
    conn
    |> render "index.html"
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    changeset = User.create(params["user"])
    cond do
      changeset.valid? ->
        Cooking.Repo.insert changeset
        conn
        |> put_flash(:notice, "User successfully created")
        |> render "index.html"
      !changeset.valid? ->
        conn
        |> put_flash(:notice, "User creation failed: #{inspect changeset.errors}")
        |> render "index.html"
    end
  end
end
