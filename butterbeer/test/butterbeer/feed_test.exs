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
end
