defmodule RiakCache.Mixfile do
  use Mix.Project

  def project do
    [app: :riak_cache,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:riak_core, :logger],
     mod: {RiakCache.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    #[{:riak_core, git: "https://github.com/basho/riak_core.git", branch: "develop"}]
    [{:riak_core, "~> 2.2", hex: :riak_core_ng}]
  end
end
