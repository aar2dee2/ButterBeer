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

  #The cast function above so make changes to several tables in the db - 
  # 1/ Add to areas_level_one - long_name, short_name and country_id
  # 2/ Add to areas_level_two - long_name, short_name and area_level_one (id)
  # 3/ Add to localities - long_name, short_name, area_level_two (id)
  # 4/ Add to neighborhoods - long_name, short_name, locality_id
  # 5/ Add to places - name, url, google_maps_link, neighborhood (id)
  # 6/ Add to dineposts - description (from form), place_id (refer to places), user_id(refer to user)
  # Most of the above should be covered by existing functions in the Location context.
  # So first need to fetch correct country_id from countries - this is done by Location.get_country_id/1
  # So not all places have localities and neighborhoods information. Infact some have sublocalities instead of localities. To work around this, going to just use the areas_level_one and areas_level_two tables for now. In place, can add a column to reference areas_level_two by id. So filtration will be possible on areas areas_level_one and areas_level_two
end