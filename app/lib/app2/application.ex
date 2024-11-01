defmodule App2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      App2Web.Telemetry,
      App2.Repo,
      {DNSCluster, query: Application.get_env(:app2, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: App2.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: App2.Finch},
      # Start a worker by calling: App2.Worker.start_link(arg)
      # {App2.Worker, arg},
      # Start to serve requests, typically the last entry
      App2Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: App2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    App2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
