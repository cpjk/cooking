defmodule Cooking.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Cooking.Web, :controller
      use Cooking.Web, :view

  Keep the definitions in this module short and clean,
  mostly focused on imports, uses and aliases.
  """

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import URL helpers from the router
      import Cooking.Router.Helpers
      import Phoenix.Controller, only: [get_flash: 2, get_csrf_token: 0]

      # Import all HTML functions (forms, tags, etc)
      use Phoenix.HTML

    end
  end

  def controller do
    quote do
      use Phoenix.Controller
      use Cooking.AssignsHelpers
      use Cooking.SessionHelpers

      # Import URL helpers from the router
      import Cooking.Router.Helpers
    end
  end

  def model do
    quote do
      use Ecto.Model

      alias Cooking.Repo
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
