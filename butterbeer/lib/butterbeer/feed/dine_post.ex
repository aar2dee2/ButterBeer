defmodule Butterbeer.Feed.DinePost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dineposts" do
    field :created_at, :naive_datetime
    field :description, :string
    field :place_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(dine_post, attrs) do
    dine_post
    |> cast(attrs, [:created_at, :description])
    |> validate_required([:created_at, :description])
  end
end
