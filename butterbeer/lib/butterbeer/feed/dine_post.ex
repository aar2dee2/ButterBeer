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
    |> cast(attrs, [:description, :place_id])
    |> validate_required([:description, :place_id])
  end
end