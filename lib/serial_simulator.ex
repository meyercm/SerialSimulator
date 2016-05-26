defmodule SerialSimulator do

  @doc """

  creates a PTY at the os to facilitate serial connection testing.

  In an actual test setting, you would want to create the pty before instantiating
  the system under test, then passing the returned name (e.g. `'/dev/ttys009'`) to
  the SUT to open instead of the proper tty.

  ## EXAMPLES:

    iex> {:ok, {port, name}} = SerialSimulator.open_pty
    {:ok, {#Port<0.5596>, '/dev/ttys009'}}
    ...> {:ok, serial} = :gen_serial.open(name, active: true)
    {:ok, {:gen_serial, #PID<0.193.0>, #Port<0.5597>}}
    ...> :gen_serial.send(serial, "from_serial")
    :ok
    ...> flush
    {#Port<0.5596>, {:data, "from_serial"}}  # received from the port
    :ok
    ...> Port.command(port, "from_port")
    true
    ...> flush
    {:serial, {:gen_serial, #PID<0.193.0>, #Port<0.5597>}, "from_port"} # received from gen_serial
    :ok

  """
  def open_pty do
    :pty.init
    {fd1, name} = :pty.allocate_pty
    port = :erlang.open_port({:fd, fd1, fd1}, [:binary, :stream])
    {:ok, {port, name}}
  end
end
