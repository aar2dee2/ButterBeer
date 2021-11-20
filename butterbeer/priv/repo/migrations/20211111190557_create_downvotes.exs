defmodule Butterbeer.Repo.Migrations.CreateDownvotes do
  use Ecto.Migration

  def change do
    create table(:downvotes) do
      add :dinepost_id, references(:dineposts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:downvotes, [:dinepost_id])
    create index(:downvotes, [:user_id])
    create unique_index(:downvotes, [:dinepost_id, :user_id], name: :downvote_dinepost_user)
  end
end
