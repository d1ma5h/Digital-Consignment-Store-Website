defmodule DS.Repo do
  use Ecto.Repo,
    otp_app: :digital_store,
    adapter: Ecto.Adapters.Postgres
end
