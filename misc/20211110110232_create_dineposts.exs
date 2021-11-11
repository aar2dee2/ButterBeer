defmodule Butterbeer.Repo.Migrations.CreateDineposts do
  use Ecto.Migration

  def change do
    create table(:dineposts) do
      add :created_at, :naive_datetime
      add :description, :string
      add :place_id, references(:places, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:dineposts, [:place_id])
    create index(:dineposts, [:user_id])
  end
end
