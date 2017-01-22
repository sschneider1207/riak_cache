defmodule RiakCache.Vnode do
  @behaviour :riak_core_vnode

  def start_vnode(term) do
    :riak_core_vnode_master.get_vnode_pid(term, __MODULE__)
  end

  @doc false
  def init([partition]) do
    {:ok, nil}
  end

  @doc false
  def handle_command(cmd, sender, state) do
    {:reply, :ok, state}
  end

  @doc false
  def handle_handoff_command(msg, sender, state) do
    {:noreply, state}
  end

  @doc false
  def handoff_starting(target_node, state) do
    {true, state}
  end

  @doc false
  def handoff_cancelled(state) do
    {:ok, state}
  end

  @doc false
  def handoff_finished(target_node, state) do
    {:ok, state}
  end

  @doc false
  def handle_handoff_data(data, state) do
    {:reply, :ok, state}
  end

  @doc false
  def encode_handoff_item(name, val) do
    ""
  end

  @doc false
  def is_empty(state) do
    {true, state}
  end

  @doc false
  def delete(state) do
    {:ok, state}
  end

  @doc false
  def handle_coverage(req, key_spaces, sender, state) do
    {:stop, :not_implemented, state}
  end

  @doc false
  def handle_exit(pid, reason, state) do
    {:noreply, state}
  end

  @doc false
  def terminate(reason, state) do
    :ok
  end
end
