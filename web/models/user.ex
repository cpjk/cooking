defmodule Cooking.User do
  use Ecto.Model

  schema "users" do
    field :first_name
    field :last_name

    timestamps
  end
end
