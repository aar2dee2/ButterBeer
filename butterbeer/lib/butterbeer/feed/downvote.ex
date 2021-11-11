defmodule Butterbeer.Feed.Downvote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "downvotes" do
    field :dinepost_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(downvote, attrs) do
    downvote
    |> cast(attrs, [])
    |> validate_required([])
  end
end
