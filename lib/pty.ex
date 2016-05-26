defmodule :pty do
  def init, do: :erlang.load_nif('priv/bin/pty_nif', 0)
  def allocate_pty, do: "nif not loaded"
end
