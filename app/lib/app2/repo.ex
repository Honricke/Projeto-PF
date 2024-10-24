defmodule App2.Repo do
  use Ecto.Repo,
    otp_app: :app2,
    adapter: Ecto.Adapters.Postgres
end
