defmodule Todoio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TodoioWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Todoio.PubSub},
      # Start the Endpoint (http/https)
      TodoioWeb.Endpoint
      # Start a worker by calling: Todoio.Worker.start_link(arg)
      # {Todoio.Worker, arg}
    ]

    Todoio.TodoListAgent.start_link_named([%{text: "Get this list working!", complete: false}], :todo_list)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todoio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
