defmodule Butterbeer.Location.Neighborhood do
  use Ecto.Schema
  import Ecto.Changeset

  schema "neighborhoods" do
    field :long_name, :string
    field :short_name, :string
    #field :locality_id, :id

    belongs_to :locality, Butterbeer.Location.Locality
    timestamps()
  end

  @doc false
  def changeset(neighborhood, attrs) do
    neighborhood
    |> cast(attrs, [:long_name, :locality_id])
    |> validate_required([:long_name, :locality_id])
  end
end
