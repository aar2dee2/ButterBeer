defmodule Butterbeer.Repo.Migrations.CreateAreasLevel1 do
  use Ecto.Migration

  def change do
    create table(:areas_level_one) do
      add :long_name, :string
      add :short_name, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:areas_level_one, [:country_id])
    create unique_index(:areas_level_one, [:country_id, :long_name], name: :country_area_1)
  end
end
