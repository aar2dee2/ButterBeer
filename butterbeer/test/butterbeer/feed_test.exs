defmodule Butterbeer.FeedTest do
  use Butterbeer.DataCase

  alias Butterbeer.Feed

  describe "dineposts" do
    alias Butterbeer.Feed.DinePost

    import Butterbeer.FeedFixtures

    @invalid_attrs %{created_at: nil, description: nil}

    test "list_dineposts/0 returns all dineposts" do
      dine_post = dine_post_fixture()
      assert Feed.list_dineposts() == [dine_post]
    end

    test "get_dine_post!/1 returns the dine_post with given id" do
      dine_post = dine_post_fixture()
      assert Feed.get_dine_post!(dine_post.id) == dine_post
    end

    test "create_dine_post/1 with valid data creates a dine_post" do
      valid_attrs = %{created_at: ~N[2021-11-09 11:02:00], description: "some description"}

      assert {:ok, %DinePost{} = dine_post} = Feed.create_dine_post(valid_attrs)
      assert dine_post.created_at == ~N[2021-11-09 11:02:00]
      assert dine_post.description == "some description"
    end

    test "create_dine_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_dine_post(@invalid_attrs)
    end

    test "update_dine_post/2 with valid data updates the dine_post" do
      dine_post = dine_post_fixture()
      update_attrs = %{created_at: ~N[2021-11-10 11:02:00], description: "some updated description"}

      assert {:ok, %DinePost{} = dine_post} = Feed.update_dine_post(dine_post, update_attrs)
      assert dine_post.created_at == ~N[2021-11-10 11:02:00]
      assert dine_post.description == "some updated description"
    end

    test "update_dine_post/2 with invalid data returns error changeset" do
      dine_post = dine_post_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_dine_post(dine_post, @invalid_attrs)
      assert dine_post == Feed.get_dine_post!(dine_post.id)
    end

    test "delete_dine_post/1 deletes the dine_post" do
      dine_post = dine_post_fixture()
      assert {:ok, %DinePost{}} = Feed.delete_dine_post(dine_post)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_dine_post!(dine_post.id) end
    end

    test "change_dine_post/1 returns a dine_post changeset" do
      dine_post = dine_post_fixture()
      assert %Ecto.Changeset{} = Feed.change_dine_post(dine_post)
    end
  end

  describe "upvotes" do
    alias Butterbeer.Feed.Upvote

    import Butterbeer.FeedFixtures

    @invalid_attrs %{}

    test "list_upvotes/0 returns all upvotes" do
      upvote = upvote_fixture()
      assert Feed.list_upvotes() == [upvote]
    end

    test "get_upvote!/1 returns the upvote with given id" do
      upvote = upvote_fixture()
      assert Feed.get_upvote!(upvote.id) == upvote
    end

    test "create_upvote/1 with valid data creates a upvote" do
      valid_attrs = %{}

      assert {:ok, %Upvote{} = upvote} = Feed.create_upvote(valid_attrs)
    end

    test "create_upvote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_upvote(@invalid_attrs)
    end

    test "update_upvote/2 with valid data updates the upvote" do
      upvote = upvote_fixture()
      update_attrs = %{}

      assert {:ok, %Upvote{} = upvote} = Feed.update_upvote(upvote, update_attrs)
    end

    test "update_upvote/2 with invalid data returns error changeset" do
      upvote = upvote_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_upvote(upvote, @invalid_attrs)
      assert upvote == Feed.get_upvote!(upvote.id)
    end

    test "delete_upvote/1 deletes the upvote" do
      upvote = upvote_fixture()
      assert {:ok, %Upvote{}} = Feed.delete_upvote(upvote)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_upvote!(upvote.id) end
    end

    test "change_upvote/1 returns a upvote changeset" do
      upvote = upvote_fixture()
      assert %Ecto.Changeset{} = Feed.change_upvote(upvote)
    end
  end

  describe "downvotes" do
    alias Butterbeer.Feed.Downvote

    import Butterbeer.FeedFixtures

    @invalid_attrs %{}

    test "list_downvotes/0 returns all downvotes" do
      downvote = downvote_fixture()
      assert Feed.list_downvotes() == [downvote]
    end

    test "get_downvote!/1 returns the downvote with given id" do
      downvote = downvote_fixture()
      assert Feed.get_downvote!(downvote.id) == downvote
    end

    test "create_downvote/1 with valid data creates a downvote" do
      valid_attrs = %{}

      assert {:ok, %Downvote{} = downvote} = Feed.create_downvote(valid_attrs)
    end

    test "create_downvote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_downvote(@invalid_attrs)
    end

    test "update_downvote/2 with valid data updates the downvote" do
      downvote = downvote_fixture()
      update_attrs = %{}

      assert {:ok, %Downvote{} = downvote} = Feed.update_downvote(downvote, update_attrs)
    end

    test "update_downvote/2 with invalid data returns error changeset" do
      downvote = downvote_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_downvote(downvote, @invalid_attrs)
      assert downvote == Feed.get_downvote!(downvote.id)
    end

    test "delete_downvote/1 deletes the downvote" do
      downvote = downvote_fixture()
      assert {:ok, %Downvote{}} = Feed.delete_downvote(downvote)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_downvote!(downvote.id) end
    end

    test "change_downvote/1 returns a downvote changeset" do
      downvote = downvote_fixture()
      assert %Ecto.Changeset{} = Feed.change_downvote(downvote)
    end
  end
end
