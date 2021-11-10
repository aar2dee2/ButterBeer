defmodule Butterbeer.Feed do
  @moduledoc """
  The Feed context.
  """

  import Ecto.Query, warn: false
  alias Butterbeer.Repo

  alias Butterbeer.Feed.DinePost

  @doc """
  Returns the list of dineposts.

  ## Examples

      iex> list_dineposts()
      [%DinePost{}, ...]

  """
  def list_dineposts do
    Repo.all(DinePost)
  end

  @doc """
  Gets a single dine_post.

  Raises `Ecto.NoResultsError` if the Dine post does not exist.

  ## Examples

      iex> get_dine_post!(123)
      %DinePost{}

      iex> get_dine_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dine_post!(id), do: Repo.get!(DinePost, id)

  @doc """
  Creates a dine_post.

  ## Examples

      iex> create_dine_post(%{field: value})
      {:ok, %DinePost{}}

      iex> create_dine_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dine_post(attrs \\ %{}) do
    %DinePost{}
    |> DinePost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dine_post.

  ## Examples

      iex> update_dine_post(dine_post, %{field: new_value})
      {:ok, %DinePost{}}

      iex> update_dine_post(dine_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dine_post(%DinePost{} = dine_post, attrs) do
    dine_post
    |> DinePost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dine_post.

  ## Examples

      iex> delete_dine_post(dine_post)
      {:ok, %DinePost{}}

      iex> delete_dine_post(dine_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dine_post(%DinePost{} = dine_post) do
    Repo.delete(dine_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dine_post changes.

  ## Examples

      iex> change_dine_post(dine_post)
      %Ecto.Changeset{data: %DinePost{}}

  """
  def change_dine_post(%DinePost{} = dine_post, attrs \\ %{}) do
    DinePost.changeset(dine_post, attrs)
  end
end
