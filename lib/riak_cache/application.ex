defmodule RiakCache.Application do
  @moduledoc false
  alias RiakCache.{CacheSupervisor, CacheVnode}

  use Application

  def start(_type, _args) do
    case CacheSupervisor.start_link() do
      {:ok, pid} ->
        :ok = :riak_core.register_vnode_module(CacheVnode)
        :ok = :riak_core_node_watcher.service_up(RiakCache, self())
        {:ok, pid}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
