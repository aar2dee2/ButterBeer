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

  describe "localities" do
    alias Butterbeer.Location.Locality

    import Butterbeer.LocationFixtures

    @invalid_attrs %{long_name: nil, short_name: nil}

    test "list_localities/0 returns all localities" do
      locality = locality_fixture()
      assert Location.list_localities() == [locality]
    end

    test "get_locality!/1 returns the locality with given id" do
      locality = locality_fixture()
      assert Location.get_locality!(locality.id) == locality
    end

    test "create_locality/1 with valid data creates a locality" do
      valid_attrs = %{long_name: "some long_name", short_name: "some short_name"}

      assert {:ok, %Locality{} = locality} = Location.create_locality(valid_attrs)
      assert locality.long_name == "some long_name"
      assert locality.short_name == "some short_name"
    end

    test "create_locality/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_locality(@invalid_attrs)
    end

    test "update_locality/2 with valid data updates the locality" do
      locality = locality_fixture()
      update_attrs = %{long_name: "some updated long_name", short_name: "some updated short_name"}

      assert {:ok, %Locality{} = locality} = Location.update_locality(locality, update_attrs)
      assert locality.long_name == "some updated long_name"
      assert locality.short_name == "some updated short_name"
    end

    test "update_locality/2 with invalid data returns error changeset" do
      locality = locality_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_locality(locality, @invalid_attrs)
      assert locality == Location.get_locality!(locality.id)
    end

    test "delete_locality/1 deletes the locality" do
      locality = locality_fixture()
      assert {:ok, %Locality{}} = Location.delete_locality(locality)
      assert_raise Ecto.NoResultsError, fn -> Location.get_locality!(locality.id) end
    end

    test "change_locality/1 returns a locality changeset" do
      locality = locality_fixture()
      assert %Ecto.Changeset{} = Location.change_locality(locality)
    end
  end

  describe "neighborhoods" do
    alias Butterbeer.Location.Neighborhood

    import Butterbeer.LocationFixtures

    @invalid_attrs %{long_name: nil, short_name: nil}

    test "list_neighborhoods/0 returns all neighborhoods" do
      neighborhood = neighborhood_fixture()
      assert Location.list_neighborhoods() == [neighborhood]
    end

    test "get_neighborhood!/1 returns the neighborhood with given id" do
      neighborhood = neighborhood_fixture()
      assert Location.get_neighborhood!(neighborhood.id) == neighborhood
    end

    test "create_neighborhood/1 with valid data creates a neighborhood" do
      valid_attrs = %{long_name: "some long_name", short_name: "some short_name"}

      assert {:ok, %Neighborhood{} = neighborhood} = Location.create_neighborhood(valid_attrs)
      assert neighborhood.long_name == "some long_name"
      assert neighborhood.short_name == "some short_name"
    end

    test "create_neighborhood/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_neighborhood(@invalid_attrs)
    end

    test "update_neighborhood/2 with valid data updates the neighborhood" do
      neighborhood = neighborhood_fixture()
      update_attrs = %{long_name: "some updated long_name", short_name: "some updated short_name"}

      assert {:ok, %Neighborhood{} = neighborhood} = Location.update_neighborhood(neighborhood, update_attrs)
      assert neighborhood.long_name == "some updated long_name"
      assert neighborhood.short_name == "some updated short_name"
    end

    test "update_neighborhood/2 with invalid data returns error changeset" do
      neighborhood = neighborhood_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_neighborhood(neighborhood, @invalid_attrs)
      assert neighborhood == Location.get_neighborhood!(neighborhood.id)
    end

    test "delete_neighborhood/1 deletes the neighborhood" do
      neighborhood = neighborhood_fixture()
      assert {:ok, %Neighborhood{}} = Location.delete_neighborhood(neighborhood)
      assert_raise Ecto.NoResultsError, fn -> Location.get_neighborhood!(neighborhood.id) end
    end

    test "change_neighborhood/1 returns a neighborhood changeset" do
      neighborhood = neighborhood_fixture()
      assert %Ecto.Changeset{} = Location.change_neighborhood(neighborhood)
    end
  end

  describe "places" do
    alias Butterbeer.Location.Place

    import Butterbeer.LocationFixtures

    @invalid_attrs %{google_maps_link: nil, name: nil, url: nil}

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Location.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Location.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      valid_attrs = %{google_maps_link: "some google_maps_link", name: "some name", url: "some url"}

      assert {:ok, %Place{} = place} = Location.create_place(valid_attrs)
      assert place.google_maps_link == "some google_maps_link"
      assert place.name == "some name"
      assert place.url == "some url"
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      update_attrs = %{google_maps_link: "some updated google_maps_link", name: "some updated name", url: "some updated url"}

      assert {:ok, %Place{} = place} = Location.update_place(place, update_attrs)
      assert place.google_maps_link == "some updated google_maps_link"
      assert place.name == "some updated name"
      assert place.url == "some updated url"
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_place(place, @invalid_attrs)
      assert place == Location.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Location.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Location.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Location.change_place(place)
    end
  end
end
