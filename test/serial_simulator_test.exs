defmodule SerialSimulatorTest do
  use ExUnit.Case
  #doctest SerialSimulator

  test "read from serial" do
    {:ok, {port, name}} = SerialSimulator.open_pty

    :os.cmd("echo test > #{name}" |> String.to_char_list)

    assert_receive({^port, {:data, "test\r\n"}}, 100)
  end


  test "write to serial" do
    {:ok, {port, name}} = SerialSimulator.open_pty
    test_string = "test\n"
    Port.command(port, test_string)

    result = "dd bs=1 count=#{String.length(test_string)} if=#{name} 2>/dev/null"
             |> String.to_char_list
             |> :os.cmd
             |> List.to_string

    assert result == test_string
  end
end
