defmodule SerialSimulator.Mixfile do
  use Mix.Project

  def project do
    [app: :serial_simulator,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
    ]
  end

  defp deps do
    [
      {:syn, "~> 1.4"},
      {:gen_serial, github: "kovyl2404/gen_serial"},
      {:logger_file_backend, github: "onkel-dirtus/logger_file_backend"},
    ]
  end
end
