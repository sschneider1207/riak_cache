defmodule RiakCache.Application do
  @moduledoc false
  alias RiakCache.{CacheSupervisor, CacheVnode}

  use Application

  def start(_type, _args) do
    with {:ok, pid} <- CacheSupervisor.start_link(),
         :ok        <- :riak_core.register_vnode_module(CacheVnode),
         :ok        <- :riak_core_node_water.service_up(RiakCache, self()),
         do: {:ok, pid}
  end
end
