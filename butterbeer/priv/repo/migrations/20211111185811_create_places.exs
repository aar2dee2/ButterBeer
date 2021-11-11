defmodule Butterbeer.Repo.Migrations.CreatePlaces do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string
      add :url, :string
      add :google_maps_link, :string
      add :neighborhood, references(:neighborhoods, on_delete: :nothing)

      timestamps()
    end

    create index(:places, [:neighborhood])
    create unique_index(:places, [:neighborhood, :name], name: :neighborhood_name)
  end
end
