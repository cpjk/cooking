defmodule Cooking.AssignsHelpers do
  defmacro __using__(_) do
    quote do
      defp get_current_user(conn, _opts) do
        current_user = current_user(conn)
        conn = %{conn | assigns: Map.put(conn.assigns, :current_user, current_user)}
      end
    end
  end
end
