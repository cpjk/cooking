defmodule Cooking.Repo do
  use Ecto.Repo,
  otp_app: :cooking,
  adapter: Ecto.Adapters.Postgres
end
