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

  alias Butterbeer.Feed.Upvote

  @doc """
  Returns the list of upvotes.

  ## Examples

      iex> list_upvotes()
      [%Upvote{}, ...]

  """
  def list_upvotes do
    Repo.all(Upvote)
  end

  @doc """
  Gets a single upvote.

  Raises `Ecto.NoResultsError` if the Upvote does not exist.

  ## Examples

      iex> get_upvote!(123)
      %Upvote{}

      iex> get_upvote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_upvote!(id), do: Repo.get!(Upvote, id)

  @doc """
  Creates a upvote.

  ## Examples

      iex> create_upvote(%{field: value})
      {:ok, %Upvote{}}

      iex> create_upvote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_upvote(attrs \\ %{}) do
    %Upvote{}
    |> Upvote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a upvote.

  ## Examples

      iex> update_upvote(upvote, %{field: new_value})
      {:ok, %Upvote{}}

      iex> update_upvote(upvote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_upvote(%Upvote{} = upvote, attrs) do
    upvote
    |> Upvote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a upvote.

  ## Examples

      iex> delete_upvote(upvote)
      {:ok, %Upvote{}}

      iex> delete_upvote(upvote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_upvote(%Upvote{} = upvote) do
    Repo.delete(upvote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking upvote changes.

  ## Examples

      iex> change_upvote(upvote)
      %Ecto.Changeset{data: %Upvote{}}

  """
  def change_upvote(%Upvote{} = upvote, attrs \\ %{}) do
    Upvote.changeset(upvote, attrs)
  end

  alias Butterbeer.Feed.Downvote

  @doc """
  Returns the list of downvotes.

  ## Examples

      iex> list_downvotes()
      [%Downvote{}, ...]

  """
  def list_downvotes do
    Repo.all(Downvote)
  end

  @doc """
  Gets a single downvote.

  Raises `Ecto.NoResultsError` if the Downvote does not exist.

  ## Examples

      iex> get_downvote!(123)
      %Downvote{}

      iex> get_downvote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_downvote!(id), do: Repo.get!(Downvote, id)

  @doc """
  Creates a downvote.

  ## Examples

      iex> create_downvote(%{field: value})
      {:ok, %Downvote{}}

      iex> create_downvote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_downvote(attrs \\ %{}) do
    %Downvote{}
    |> Downvote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a downvote.

  ## Examples

      iex> update_downvote(downvote, %{field: new_value})
      {:ok, %Downvote{}}

      iex> update_downvote(downvote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_downvote(%Downvote{} = downvote, attrs) do
    downvote
    |> Downvote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a downvote.

  ## Examples

      iex> delete_downvote(downvote)
      {:ok, %Downvote{}}

      iex> delete_downvote(downvote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_downvote(%Downvote{} = downvote) do
    Repo.delete(downvote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking downvote changes.

  ## Examples

      iex> change_downvote(downvote)
      %Ecto.Changeset{data: %Downvote{}}

  """
  def change_downvote(%Downvote{} = downvote, attrs \\ %{}) do
    Downvote.changeset(downvote, attrs)
  end
end
