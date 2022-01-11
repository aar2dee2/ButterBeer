defmodule Butterbeer.Location.Locality do
  use Ecto.Schema
  import Ecto.Changeset

  schema "localities" do
    field :long_name, :string
    field :short_name, :string
    field :area_level_two, :id

    timestamps()
  end

  @doc false
  def changeset(locality, attrs) do
    locality
    |> cast(attrs, [:long_name, :area_level_two])
    |> validate_required([:long_name, :area_level_two])
  end
end
