defmodule Cooking.User do
  use Cooking.Web, :model

  alias Cooking.User
  import Comeonin.Bcrypt

  schema "users" do
    field :first_name
    field :last_name
    field :hashed_password
    field :email

    timestamps
  end

  def create(params \\ nil) do
    %User{}
    |> cast(processed_params(params), ~w(first_name last_name hashed_password email))
    |> validate_unique(:email, on: Repo)
  end

  # move to Cooking.Web
  def changeset(user, params \\ nil) do
    cast(user, params, ~w(first_name last_name password email))
  end

  def by_email(email) do
    User
    |> where([u], u.email == ^email)
    |> select([u], u)
    |> Repo.one
  end

  def login(%{"email" => email, "password" => password}) do
    email
    |> by_email
    |> test_password(password)
  end

  defp test_password(nil, _), do: dummy_checkpw
  defp test_password(user = %User{}, password) do
    checkpw(password, user.hashed_password) && user
  end

  defp hashed_password(password), do: Comeonin.Bcrypt.hashpwsalt(password)

  defp processed_params(params) do
    Enum.into params, %{}, fn
      ({ "password", password }) -> { "hashed_password", hashed_password(password) }
      ({ key, value })           -> { key, value }
    end
  end
end
