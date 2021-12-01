defmodule Butterbeer.Location do
  @moduledoc """
  The Location context.
  """

  import Ecto.Query, warn: false
  alias Butterbeer.Repo

  alias Butterbeer.Location.AdminAreaOne

  @doc """
  Fetches the country_id from the countries table when country name is provided as input
  """
  def get_country_id(name) do
    query = from c in "countries", select: c.country_id, where: ilike(c.country_or_area, ^name)
    Repo.all(query) |> Enum.fetch!(0)
  end


  @doc """
  Returns the list of areas_level_one.

  ## Examples

      iex> list_areas_level_one()
      [%AdminAreaOne{}, ...]

  """
  def list_areas_level_one do
    Repo.all(AdminAreaOne)
  end

  @doc """
  Gets a single admin_area_one.

  Raises `Ecto.NoResultsError` if the Admin area one does not exist.

  ## Examples

      iex> get_admin_area_one!(123)
      %AdminAreaOne{}

      iex> get_admin_area_one!(456)
      ** (Ecto.NoResultsError)

  """
  def get_admin_area_one!(id), do: Repo.get!(AdminAreaOne, id)

  @doc """
  Creates a admin_area_one.

  ## Examples

      iex> create_admin_area_one(%{field: value})
      {:ok, %AdminAreaOne{}}

      iex> create_admin_area_one(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_admin_area_one(attrs \\ %{}) do
    %AdminAreaOne{}
    |> AdminAreaOne.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a admin_area_one.

  ## Examples

      iex> update_admin_area_one(admin_area_one, %{field: new_value})
      {:ok, %AdminAreaOne{}}

      iex> update_admin_area_one(admin_area_one, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_admin_area_one(%AdminAreaOne{} = admin_area_one, attrs) do
    admin_area_one
    |> AdminAreaOne.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a admin_area_one.

  ## Examples

      iex> delete_admin_area_one(admin_area_one)
      {:ok, %AdminAreaOne{}}

      iex> delete_admin_area_one(admin_area_one)
      {:error, %Ecto.Changeset{}}

  """
  def delete_admin_area_one(%AdminAreaOne{} = admin_area_one) do
    Repo.delete(admin_area_one)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking admin_area_one changes.

  ## Examples

      iex> change_admin_area_one(admin_area_one)
      %Ecto.Changeset{data: %AdminAreaOne{}}

  """
  def change_admin_area_one(%AdminAreaOne{} = admin_area_one, attrs \\ %{}) do
    AdminAreaOne.changeset(admin_area_one, attrs)
  end

  alias Butterbeer.Location.AdminAreaTwo

  @doc """
  Returns the list of areas_level_two.

  ## Examples

      iex> list_areas_level_two()
      [%AdminAreaTwo{}, ...]

  """
  def list_areas_level_two do
    Repo.all(AdminAreaTwo)
  end

  @doc """
  Gets a single admin_area_two.

  Raises `Ecto.NoResultsError` if the Admin area two does not exist.

  ## Examples

      iex> get_admin_area_two!(123)
      %AdminAreaTwo{}

      iex> get_admin_area_two!(456)
      ** (Ecto.NoResultsError)

  """
  def get_admin_area_two!(id), do: Repo.get!(AdminAreaTwo, id)

  @doc """
  Creates a admin_area_two.

  ## Examples

      iex> create_admin_area_two(%{field: value})
      {:ok, %AdminAreaTwo{}}

      iex> create_admin_area_two(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_admin_area_two(attrs \\ %{}) do
    %AdminAreaTwo{}
    |> AdminAreaTwo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a admin_area_two.

  ## Examples

      iex> update_admin_area_two(admin_area_two, %{field: new_value})
      {:ok, %AdminAreaTwo{}}

      iex> update_admin_area_two(admin_area_two, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_admin_area_two(%AdminAreaTwo{} = admin_area_two, attrs) do
    admin_area_two
    |> AdminAreaTwo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a admin_area_two.

  ## Examples

      iex> delete_admin_area_two(admin_area_two)
      {:ok, %AdminAreaTwo{}}

      iex> delete_admin_area_two(admin_area_two)
      {:error, %Ecto.Changeset{}}

  """
  def delete_admin_area_two(%AdminAreaTwo{} = admin_area_two) do
    Repo.delete(admin_area_two)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking admin_area_two changes.

  ## Examples

      iex> change_admin_area_two(admin_area_two)
      %Ecto.Changeset{data: %AdminAreaTwo{}}

  """
  def change_admin_area_two(%AdminAreaTwo{} = admin_area_two, attrs \\ %{}) do
    AdminAreaTwo.changeset(admin_area_two, attrs)
  end

  alias Butterbeer.Location.Locality

  @doc """
  Returns the list of localities.

  ## Examples

      iex> list_localities()
      [%Locality{}, ...]

  """
  def list_localities do
    Repo.all(Locality)
  end

  @doc """
  Gets a single locality.

  Raises `Ecto.NoResultsError` if the Locality does not exist.

  ## Examples

      iex> get_locality!(123)
      %Locality{}

      iex> get_locality!(456)
      ** (Ecto.NoResultsError)

  """
  def get_locality!(id), do: Repo.get!(Locality, id)

  @doc """
  Creates a locality.

  ## Examples

      iex> create_locality(%{field: value})
      {:ok, %Locality{}}

      iex> create_locality(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_locality(attrs \\ %{}) do
    %Locality{}
    |> Locality.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a locality.

  ## Examples

      iex> update_locality(locality, %{field: new_value})
      {:ok, %Locality{}}

      iex> update_locality(locality, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_locality(%Locality{} = locality, attrs) do
    locality
    |> Locality.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a locality.

  ## Examples

      iex> delete_locality(locality)
      {:ok, %Locality{}}

      iex> delete_locality(locality)
      {:error, %Ecto.Changeset{}}

  """
  def delete_locality(%Locality{} = locality) do
    Repo.delete(locality)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking locality changes.

  ## Examples

      iex> change_locality(locality)
      %Ecto.Changeset{data: %Locality{}}

  """
  def change_locality(%Locality{} = locality, attrs \\ %{}) do
    Locality.changeset(locality, attrs)
  end

  alias Butterbeer.Location.Neighborhood

  @doc """
  Returns the list of neighborhoods.

  ## Examples

      iex> list_neighborhoods()
      [%Neighborhood{}, ...]

  """
  def list_neighborhoods do
    Repo.all(Neighborhood)
  end

  @doc """
  Gets a single neighborhood.

  Raises `Ecto.NoResultsError` if the Neighborhood does not exist.

  ## Examples

      iex> get_neighborhood!(123)
      %Neighborhood{}

      iex> get_neighborhood!(456)
      ** (Ecto.NoResultsError)

  """
  def get_neighborhood!(id), do: Repo.get!(Neighborhood, id)

  @doc """
  Creates a neighborhood.

  ## Examples

      iex> create_neighborhood(%{field: value})
      {:ok, %Neighborhood{}}

      iex> create_neighborhood(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_neighborhood(attrs \\ %{}) do
    %Neighborhood{}
    |> Neighborhood.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a neighborhood.

  ## Examples

      iex> update_neighborhood(neighborhood, %{field: new_value})
      {:ok, %Neighborhood{}}

      iex> update_neighborhood(neighborhood, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_neighborhood(%Neighborhood{} = neighborhood, attrs) do
    neighborhood
    |> Neighborhood.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a neighborhood.

  ## Examples

      iex> delete_neighborhood(neighborhood)
      {:ok, %Neighborhood{}}

      iex> delete_neighborhood(neighborhood)
      {:error, %Ecto.Changeset{}}

  """
  def delete_neighborhood(%Neighborhood{} = neighborhood) do
    Repo.delete(neighborhood)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking neighborhood changes.

  ## Examples

      iex> change_neighborhood(neighborhood)
      %Ecto.Changeset{data: %Neighborhood{}}

  """
  def change_neighborhood(%Neighborhood{} = neighborhood, attrs \\ %{}) do
    Neighborhood.changeset(neighborhood, attrs)
  end

  alias Butterbeer.Location.Place

  @doc """
  Returns the list of places.

  ## Examples

      iex> list_places()
      [%Place{}, ...]

  """
  def list_places do
    Repo.all(Place)
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}) do
    %Place{}
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{data: %Place{}}

  """
  def change_place(%Place{} = place, attrs \\ %{}) do
    Place.changeset(place, attrs)
  end
end
