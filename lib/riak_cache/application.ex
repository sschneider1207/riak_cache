defmodule RiakCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    case RiakCache.CacheSupervisor.start_link() do
      {:ok, pid} ->
        :ok = :riak_core.register([{:vnode_module, RiakCache.Vnode}])
        :ok = :riak_core_node_watcher.service_up(RiakCache.Service, self())
        {:ok, pid}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
