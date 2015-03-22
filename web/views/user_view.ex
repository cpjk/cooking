defmodule Cooking.UserView do
  use Cooking.Web, :view

  import Ecto.Query

  alias Cooking.User
  alias Cooking.Repo

  def all_users do
    q = from u in User,
        select: u
    Repo.all(q)
  end
end
