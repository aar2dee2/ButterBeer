defmodule Butterbeer.Location.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :google_maps_link, :string
    field :name, :string
    field :url, :string
    field :neighborhood, :id

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:name, :url, :google_maps_link])
    |> validate_required([:name, :url, :google_maps_link])
  end
end
