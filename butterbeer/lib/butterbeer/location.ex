defmodule Butterbeer.Location do
  @moduledoc """
  The Location context.
  """

  import Ecto.Query, warn: false
  alias Butterbeer.Repo

  alias Butterbeer.Location.AdminAreaOne

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
end
