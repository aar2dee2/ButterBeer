defmodule Butterbeer.Feed.Upvote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "upvotes" do
    field :dinepost_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(upvote, attrs) do
    upvote
    |> cast(attrs, [])
    |> validate_required([])
  end
end
