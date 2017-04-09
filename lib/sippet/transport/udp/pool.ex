defmodule Sippet.Transport.UDP.Pool do

  @spec spec() :: Supervisor.Spec.spec
  def spec() do
    alias Sippet.Transport.UDP.Conn, as: Conn

    defaults = [
      size: System.schedulers_online(),

      # overflow is generally useless, as workers
      # will do busy processing
      max_overflow: 0
    ]

    Sippet.PoolboyUtil.child_spec(__MODULE__, Conn, defaults)
  end

  @spec check_out() :: pid
  def check_out(), do: Sippet.PoolboyUtil.check_out(__MODULE__)

  @spec check_in(pid) :: :ok
  def check_in(worker), do: Sippet.PoolboyUtil.check_in(__MODULE__, worker)
end