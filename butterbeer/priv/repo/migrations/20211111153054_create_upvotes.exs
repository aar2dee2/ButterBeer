defmodule Butterbeer.Repo.Migrations.CreateUpvotes do
  use Ecto.Migration

  def change do
    create table(:upvotes) do
      add :dinepost_id, references(:dineposts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:upvotes, [:dinepost_id])
    create index(:upvotes, [:user_id])
    create unique_index(:upvotes, [:user_id, :dinepost_id], :user_dinepost)
  end
end
