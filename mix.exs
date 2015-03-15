defmodule Cooking.Mixfile do
  use Mix.Project

  def project do
    [app: :cooking,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Cooking, []},
      applications: [
       :phoenix, :cowboy, :logger, :comeonin
      ]
    ]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.10.0"},
     {:cowboy, "~> 1.0"},
     { :postgrex, "~> 0.8.0" },
     { :ecto, "~> 0.9.0" },
     { :phoenix_ecto, "~> 0.1" },
     { :comeonin, "~> 0.3" }
   ]
  end
end
