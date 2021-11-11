defmodule Butterbeer.Location.AdminAreaOne do
  use Ecto.Schema
  import Ecto.Changeset

  schema "areas_level_one" do
    field :long_name, :string
    field :short_name, :string
    field :country_id, :id

    timestamps()
  end

  @doc false
  def changeset(admin_area_one, attrs) do
    admin_area_one
    |> cast(attrs, [:long_name, :short_name])
    |> validate_required([:long_name, :short_name])
  end
end
