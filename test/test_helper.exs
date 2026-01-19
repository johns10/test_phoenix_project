case System.get_env("LOG_LEVEL") do
  nil -> :ok
  level -> Logger.configure(level: String.to_existing_atom(level))
end

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(TestPhoenixProject.Repo, :manual)
