defmodule Butterbeer.Feed.DinePost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dineposts" do
    field :created_at, :naive_datetime
    field :description, :string
    #field :place_id, :id
    #field :user_id, :id
    
    belongs_to :user, Butterbeer.Accounts.User
    belongs_to :place, Butterbeer.Location.Place
    #Refer page 226 (of pdf) of Programming Phoenix book
    timestamps()
  end

  @doc false
  def changeset(dine_post, attrs) do
    dine_post
    |> cast(attrs, [:description, :place_id])
    |> validate_required([:description, :place_id])
  end

  #The cast function above so make changes to several tables in the db - 
  # get_country_id for the country
  # check if admin_area_one for the country is there in the areas_level_one database for the specific country
  # a) if admin_area_one is there - fetch it's id
  # b) if not there - create an entry with - long_name, short_name and country_id
  # If case is a) check if admin_area_two is in the areas_level_two  - 
  # If there go for c) fetch it's id
  # If not there for d) create entry for admin_area_two with - long_name, short_name and area_level_one (id)
  # if case is b) - do for d) create entry in areas_level_two
  # Add to places - name, url, google_maps_link, areas_level_two (id)
  # Add to dineposts - description (from form), place_id (refer to places), user_id(refer to user)
  # Most of the above should be covered by existing functions in the Location context.
  # So first need to fetch correct country_id from countries - this is done by Location.get_country_id/1
  # So not all places have localities and neighborhoods information. Infact some have sublocalities instead of localities. To work around this, going to just use the areas_level_one and areas_level_two tables for now. In place, can add a column to reference areas_level_two by id. So filtration will be possible on areas areas_level_one and areas_level_two
end