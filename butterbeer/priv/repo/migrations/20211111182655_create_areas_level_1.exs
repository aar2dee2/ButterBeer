defmodule Butterbeer.Repo.Migrations.CreateAreasLevel1 do
  use Ecto.Migration

  def change do
    create table(:areas_level_1) do
      add :long_naname, :string
      add :short_name, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:areas_level_1, [:country_id])
    create unique_index(:areas_level_1, [:areas_level_1_id, :country_id], :country_area_1)
  end
end
