defmodule Butterbeer.Location.AdminAreaTwo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "areas_level_two" do
    field :long_name, :string
    field :short_name, :string
    field :area_level_one, :id

    timestamps()
  end

  @doc false
  def changeset(admin_area_two, attrs) do
    admin_area_two
    |> cast(attrs, [:long_name, :area_level_one])
    |> validate_required([:long_name, :area_level_one])
  end
end
