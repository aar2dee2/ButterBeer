defmodule Butterbeer.Repo.Migrations.CreateLocalities do
  use Ecto.Migration

  def change do
    create table(:localities) do
      add :long_name, :string
      add :short_name, :string
      add :area_level_two, references(:areas_level_two, on_delete: :nothing)

      timestamps()
    end

    create index(:localities, [:area_level_two])
    create unique_index(:localities, [:area_level_two, :long_name], :area_level_two_name)
  end
end
