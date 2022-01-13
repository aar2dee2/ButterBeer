defmodule ButterbeerWeb.DinePostController do
  use ButterbeerWeb, :controller

  alias Butterbeer.Feed
  alias Butterbeer.Feed.DinePost
  alias Butterbeer.Location

  def index(conn, _params) do
    dineposts = Feed.list_dineposts()
    render(conn, "index.html", dineposts: dineposts)
  end

  def new(conn, _params) do
    changeset = Feed.change_dine_post(%DinePost{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"country" => country,
                    "admin_area_one" => admin_area_one,
                    "admin_area_two" => admin_area_two,
                    "neighborhood" => neighborhood,
                    "locality" => locality,
                    "google_maps_place_id" => google_maps_place_id,
                    "place_name" => place_name,
                    "google_maps_url" => google_maps_url,
                    "dine_post" => dine_post_params}) do
    IO.puts("country is #{country}")
    country_id = Location.get_country_id!(country)
    IO.puts("country id is #{country_id}")
    area_one_id = Location.get_area_one_id!(admin_area_one, country_id)
    IO.puts("area_one is #{admin_area_one} and its id is #{area_one_id}")
    area_two_id = Location.get_area_two_id!(admin_area_two, area_one_id)
    IO.puts("area_two is #{admin_area_two} and its id is #{area_two_id}")
    #get locality_id, if locality name in params
    locality_id = if length(locality) > 0 do
                    Location.get_locality_id!(locality, area_two_id)
                  end
    #get neighborhood_id, if neighborhood name in params
    neighborhood_id = if length(neighborhood) > 0 do
                        Location.get_neighborhood_id!(neighborhood, locality_id)
                      end
    #get place_id
    place_id = Location.get_place_id!(%{name: place_name, google_maps_link: google_maps_url, area_two_id: area_two_id, url: nil, neighborhood: neighborhood_id})

    case Feed.create_dine_post(Map.put(dine_post_params, "place_id", place_id)) do
      {:ok, dine_post} ->
        conn
        |> put_flash(:info, "Dine post created successfully.")
        |> redirect(to: Routes.dine_post_path(conn, :show, dine_post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dine_post = Feed.get_dine_post!(id)
    render(conn, "show.html", dine_post: dine_post)
  end

  def edit(conn, %{"id" => id}) do
    dine_post = Feed.get_dine_post!(id)
    changeset = Feed.change_dine_post(dine_post)
    render(conn, "edit.html", dine_post: dine_post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dine_post" => dine_post_params}) do
    dine_post = Feed.get_dine_post!(id)

    case Feed.update_dine_post(dine_post, dine_post_params) do
      {:ok, dine_post} ->
        conn
        |> put_flash(:info, "Dine post updated successfully.")
        |> redirect(to: Routes.dine_post_path(conn, :show, dine_post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dine_post: dine_post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dine_post = Feed.get_dine_post!(id)
    {:ok, _dine_post} = Feed.delete_dine_post(dine_post)

    conn
    |> put_flash(:info, "Dine post deleted successfully.")
    |> redirect(to: Routes.dine_post_path(conn, :index))
  end
end
