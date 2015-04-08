defmodule Cooking.SessionHelpers do
  defmacro __using__(_) do
    alias Cooking.User
    alias Cooking.Repo

    quote do
      defp current_user(conn) do
        case conn |> get_session(:user_id) do
          nil     -> nil
          user_id -> Repo.get(User, user_id)
        end
      end
    end
  end
end
