defmodule Butterbeer.FeedFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Butterbeer.Feed` context.
  """

  @doc """
  Generate a dine_post.
  """
  def dine_post_fixture(attrs \\ %{}) do
    {:ok, dine_post} =
      attrs
      |> Enum.into(%{
        created_at: ~N[2021-11-09 11:02:00],
        description: "some description"
      })
      |> Butterbeer.Feed.create_dine_post()

    dine_post
  end

  @doc """
  Generate a upvote.
  """
  def upvote_fixture(attrs \\ %{}) do
    {:ok, upvote} =
      attrs
      |> Enum.into(%{

      })
      |> Butterbeer.Feed.create_upvote()

    upvote
  end

  @doc """
  Generate a downvote.
  """
  def downvote_fixture(attrs \\ %{}) do
    {:ok, downvote} =
      attrs
      |> Enum.into(%{

      })
      |> Butterbeer.Feed.create_downvote()

    downvote
  end
end
