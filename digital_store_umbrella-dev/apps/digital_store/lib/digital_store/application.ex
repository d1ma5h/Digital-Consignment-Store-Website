defmodule DS.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DS.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DS.PubSub}
      # Start a worker by calling: DS.Worker.start_link(arg)
      # {DS.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DS.Supervisor)
  end
end
