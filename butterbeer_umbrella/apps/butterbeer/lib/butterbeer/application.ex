defmodule Butterbeer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Butterbeer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Butterbeer.PubSub}
      # Start a worker by calling: Butterbeer.Worker.start_link(arg)
      # {Butterbeer.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Butterbeer.Supervisor)
  end
end
