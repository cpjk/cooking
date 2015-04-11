defmodule Cooking.AssignsHelpers do
  # TODO move into module-style plug
  defmacro __using__(_) do
    quote do
      defp put_current_user(conn, _opts) do
        current_user = current_user(conn)
        %{conn | assigns: Map.put(conn.assigns, :current_user, current_user)}
      end
    end
  end
end
