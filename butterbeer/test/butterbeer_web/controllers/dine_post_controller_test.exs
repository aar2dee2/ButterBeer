defmodule ButterbeerWeb.DinePostControllerTest do
  use ButterbeerWeb.ConnCase

  import Butterbeer.FeedFixtures

  @create_attrs %{created_at: ~N[2021-11-09 11:02:00], description: "some description"}
  @update_attrs %{created_at: ~N[2021-11-10 11:02:00], description: "some updated description"}
  @invalid_attrs %{created_at: nil, description: nil}

  describe "index" do
    test "lists all dineposts", %{conn: conn} do
      conn = get(conn, Routes.dine_post_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dineposts"
    end
  end

  describe "new dine_post" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dine_post_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dine post"
    end
  end

  describe "create dine_post" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dine_post_path(conn, :create), dine_post: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dine_post_path(conn, :show, id)

      conn = get(conn, Routes.dine_post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dine post"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dine_post_path(conn, :create), dine_post: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dine post"
    end
  end

  describe "edit dine_post" do
    setup [:create_dine_post]

    test "renders form for editing chosen dine_post", %{conn: conn, dine_post: dine_post} do
      conn = get(conn, Routes.dine_post_path(conn, :edit, dine_post))
      assert html_response(conn, 200) =~ "Edit Dine post"
    end
  end

  describe "update dine_post" do
    setup [:create_dine_post]

    test "redirects when data is valid", %{conn: conn, dine_post: dine_post} do
      conn = put(conn, Routes.dine_post_path(conn, :update, dine_post), dine_post: @update_attrs)
      assert redirected_to(conn) == Routes.dine_post_path(conn, :show, dine_post)

      conn = get(conn, Routes.dine_post_path(conn, :show, dine_post))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, dine_post: dine_post} do
      conn = put(conn, Routes.dine_post_path(conn, :update, dine_post), dine_post: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dine post"
    end
  end

  describe "delete dine_post" do
    setup [:create_dine_post]

    test "deletes chosen dine_post", %{conn: conn, dine_post: dine_post} do
      conn = delete(conn, Routes.dine_post_path(conn, :delete, dine_post))
      assert redirected_to(conn) == Routes.dine_post_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.dine_post_path(conn, :show, dine_post))
      end
    end
  end

  defp create_dine_post(_) do
    dine_post = dine_post_fixture()
    %{dine_post: dine_post}
  end
end
