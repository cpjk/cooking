defmodule Cooking.User do
  use Ecto.Model
  use Cooking.Web, :model

  schema "users" do
    field :first_name
    field :last_name

    timestamps
  end
end
