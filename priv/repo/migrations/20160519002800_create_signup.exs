defmodule LightningTalks.Repo.Migrations.CreateSignup do
  use Ecto.Migration

  def change do
    create table(:signup) do
      add :name, :string
      add :topic, :string
      add :description, :text

      timestamps
    end

  end
end
