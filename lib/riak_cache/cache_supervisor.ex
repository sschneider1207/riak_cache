defmodule RiakCache.CacheSupervisor do
  use Supervisor
  alias RiakCache.CacheVnode

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  @doc false
  def init([]) do
    children = [
      worker(:riak_core_vnode_master, [CacheVnode], [id: Module.concat(CacheVnode, Master)])
    ]

    supervise(children, [strategy: :one_for_one, max_restarts: 5, max_seconds: 10])
  end
end
