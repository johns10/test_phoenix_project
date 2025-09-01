defmodule TestPhoenixProject.Repo do
  use Ecto.Repo,
    otp_app: :test_phoenix_project,
    adapter: Ecto.Adapters.Postgres
end
