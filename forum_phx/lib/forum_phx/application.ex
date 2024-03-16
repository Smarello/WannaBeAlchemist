defmodule ForumPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ForumPhxWeb.Telemetry,
      ForumPhx.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:forum_phx, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:forum_phx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ForumPhx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ForumPhx.Finch},
      # Start a worker by calling: ForumPhx.Worker.start_link(arg)
      # {ForumPhx.Worker, arg},
      # Start to serve requests, typically the last entry
      ForumPhxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ForumPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ForumPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
