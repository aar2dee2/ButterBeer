defmodule Butterbeer.Repo.Migrations.CreateAreasLevelTwo do
  use Ecto.Migration

  def change do
    create table(:areas_level_two) do
      add :long_name, :string
      add :short_name, :string
      add :area_level_one, references(:areas_level_one, on_delete: :nothing)

      timestamps()
    end

    create index(:areas_level_two, [:area_level_one])
    create unique_index(:areas_level_two, [:area_level_one, :long_name], :area_level_one_name)
  end
end
