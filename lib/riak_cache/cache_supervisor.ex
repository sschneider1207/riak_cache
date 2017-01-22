defmodule RiakCache.CacheSupervisor do
  use Supervisor
  @id RiakCache.CacheVnode_master_worker

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :riak_cache_sup)
  end

  @doc false
  def init([]) do
    children = [
      worker(:riak_core_vnode_master, [RiakCache.CacheVnode], [id: @id])
    ]

    supervise(children, [strategy: :one_for_one, max_restarts: 5, max_seconds: 10])
  end
end
