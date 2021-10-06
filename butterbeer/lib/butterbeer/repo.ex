defmodule Butterbeer.Repo do
  use Ecto.Repo,
    otp_app: :butterbeer,
    adapter: Ecto.Adapters.Postgres
end
