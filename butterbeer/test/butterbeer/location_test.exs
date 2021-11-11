defmodule Butterbeer.LocationTest do
  use Butterbeer.DataCase

  alias Butterbeer.Location

  describe "areas_level_one" do
    alias Butterbeer.Location.AdminAreaOne

    import Butterbeer.LocationFixtures

    @invalid_attrs %{long_name: nil, short_name: nil}

    test "list_areas_level_one/0 returns all areas_level_one" do
      admin_area_one = admin_area_one_fixture()
      assert Location.list_areas_level_one() == [admin_area_one]
    end

    test "get_admin_area_one!/1 returns the admin_area_one with given id" do
      admin_area_one = admin_area_one_fixture()
      assert Location.get_admin_area_one!(admin_area_one.id) == admin_area_one
    end

    test "create_admin_area_one/1 with valid data creates a admin_area_one" do
      valid_attrs = %{long_name: "some long_name", short_name: "some short_name"}

      assert {:ok, %AdminAreaOne{} = admin_area_one} = Location.create_admin_area_one(valid_attrs)
      assert admin_area_one.long_name == "some long_name"
      assert admin_area_one.short_name == "some short_name"
    end

    test "create_admin_area_one/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_admin_area_one(@invalid_attrs)
    end

    test "update_admin_area_one/2 with valid data updates the admin_area_one" do
      admin_area_one = admin_area_one_fixture()
      update_attrs = %{long_name: "some updated long_name", short_name: "some updated short_name"}

      assert {:ok, %AdminAreaOne{} = admin_area_one} = Location.update_admin_area_one(admin_area_one, update_attrs)
      assert admin_area_one.long_name == "some updated long_name"
      assert admin_area_one.short_name == "some updated short_name"
    end

    test "update_admin_area_one/2 with invalid data returns error changeset" do
      admin_area_one = admin_area_one_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_admin_area_one(admin_area_one, @invalid_attrs)
      assert admin_area_one == Location.get_admin_area_one!(admin_area_one.id)
    end

    test "delete_admin_area_one/1 deletes the admin_area_one" do
      admin_area_one = admin_area_one_fixture()
      assert {:ok, %AdminAreaOne{}} = Location.delete_admin_area_one(admin_area_one)
      assert_raise Ecto.NoResultsError, fn -> Location.get_admin_area_one!(admin_area_one.id) end
    end

    test "change_admin_area_one/1 returns a admin_area_one changeset" do
      admin_area_one = admin_area_one_fixture()
      assert %Ecto.Changeset{} = Location.change_admin_area_one(admin_area_one)
    end
  end

  describe "areas_level_two" do
    alias Butterbeer.Location.AdminAreaTwo

    import Butterbeer.LocationFixtures

    @invalid_attrs %{long_name: nil, short_name: nil}

    test "list_areas_level_two/0 returns all areas_level_two" do
      admin_area_two = admin_area_two_fixture()
      assert Location.list_areas_level_two() == [admin_area_two]
    end

    test "get_admin_area_two!/1 returns the admin_area_two with given id" do
      admin_area_two = admin_area_two_fixture()
      assert Location.get_admin_area_two!(admin_area_two.id) == admin_area_two
    end

    test "create_admin_area_two/1 with valid data creates a admin_area_two" do
      valid_attrs = %{long_name: "some long_name", short_name: "some short_name"}

      assert {:ok, %AdminAreaTwo{} = admin_area_two} = Location.create_admin_area_two(valid_attrs)
      assert admin_area_two.long_name == "some long_name"
      assert admin_area_two.short_name == "some short_name"
    end

    test "create_admin_area_two/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_admin_area_two(@invalid_attrs)
    end

    test "update_admin_area_two/2 with valid data updates the admin_area_two" do
      admin_area_two = admin_area_two_fixture()
      update_attrs = %{long_name: "some updated long_name", short_name: "some updated short_name"}

      assert {:ok, %AdminAreaTwo{} = admin_area_two} = Location.update_admin_area_two(admin_area_two, update_attrs)
      assert admin_area_two.long_name == "some updated long_name"
      assert admin_area_two.short_name == "some updated short_name"
    end

    test "update_admin_area_two/2 with invalid data returns error changeset" do
      admin_area_two = admin_area_two_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_admin_area_two(admin_area_two, @invalid_attrs)
      assert admin_area_two == Location.get_admin_area_two!(admin_area_two.id)
    end

    test "delete_admin_area_two/1 deletes the admin_area_two" do
      admin_area_two = admin_area_two_fixture()
      assert {:ok, %AdminAreaTwo{}} = Location.delete_admin_area_two(admin_area_two)
      assert_raise Ecto.NoResultsError, fn -> Location.get_admin_area_two!(admin_area_two.id) end
    end

    test "change_admin_area_two/1 returns a admin_area_two changeset" do
      admin_area_two = admin_area_two_fixture()
      assert %Ecto.Changeset{} = Location.change_admin_area_two(admin_area_two)
    end
  end
end
