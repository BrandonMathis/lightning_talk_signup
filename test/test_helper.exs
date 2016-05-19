ExUnit.start

Mix.Task.run "ecto.create", ~w(-r LightningTalks.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r LightningTalks.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(LightningTalks.Repo)

