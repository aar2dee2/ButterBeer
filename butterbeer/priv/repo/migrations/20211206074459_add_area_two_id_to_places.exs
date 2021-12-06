defmodule Butterbeer.Repo.Migrations.AddAreaTwoIdToPlaces do
  use Ecto.Migration

  def change do
    alter table(:places) do
      add :area_level_two_id, references(:areas_level_two)
    end
  end

end
