defmodule ElixirSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirSampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirSample.PubSub},
      # Start Finch
      {Finch, name: ElixirSample.Finch},
      # Start the Endpoint (http/https)
      ElixirSampleWeb.Endpoint
      # Start a worker by calling: ElixirSample.Worker.start_link(arg)
      # {ElixirSample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
