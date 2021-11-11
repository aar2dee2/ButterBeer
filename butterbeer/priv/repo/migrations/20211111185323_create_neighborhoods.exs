defmodule Butterbeer.Repo.Migrations.CreateNeighborhoods do
  use Ecto.Migration

  def change do
    create table(:neighborhoods) do
      add :long_name, :string
      add :short_name, :string
      add :locality_id, references(:localities, on_delete: :nothing)

      timestamps()
    end

    create index(:neighborhoods, [:locality_id])
    create unique_index(:neighborhoods, [:locality_id, :long_name], :locality_id_name)
  end
end
