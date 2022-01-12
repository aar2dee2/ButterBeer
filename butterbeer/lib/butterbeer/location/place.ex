defmodule Butterbeer.Location.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :google_maps_link, :string
    field :name, :string
    field :url, :string
    field :neighborhood, :id

    belongs_to :area_level_two, Butterbeer.Location.AdminAreaTwo

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:name, :google_maps_link, :area_two_id, :url, :neighborhood])
    |> validate_required([:name, :google_maps_link, :area_two_id])
  end
end
